require 'httparty'

class AddressService < ApplicationService
  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end

  def check_database
    address = Address.find_by(latitude: @lat, longitude: @lon)
    if address
      { data: address.as_json(except: [:id, :created_at, :updated_at, :latitude, :longitude]) }
    else
      false
    end
  end

  def get_api
    url = "https://nominatim.openstreetmap.org/reverse?format=geojson&lat=#{@lat}&lon=#{@lon}"
    osmApi = HTTParty.get(url, :headers => {'Content-Type' => 'application/json'})
    if osmApi.success?
      body = JSON.parse(osmApi.body)
      data = body["features"]&.first&.dig("properties")
      

      response = {
        address: data["display_name"],
        name: data["name"],
        category: data["category"],
        addresstype: data["addresstype"],
        road: data.dig("address", "road"),
        suburb: data.dig("address", "suburb"),
        city_district: data.dig("address", "city_district"),
        city: data.dig("address", "city"),
        state: data.dig("address", "state"),
        postcode: data.dig("address", "postcode"),
        country: data.dig("address", "country")
      }

      Address.create({
        **response,
        latitude: @lat,
        longitude: @lon
      }).save()

      { data: response}
    else
      { error: "Error retrieving position."}
    end
  end

  def retrieve_address
    result = check_database
    return result if result

    get_api
  end
end