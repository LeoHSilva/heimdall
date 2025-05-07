class PositionsService < ApplicationService
  def initialize(args)
    @device_id = args[:device_id]
    @latitude = args[:latitude]
    @longitude = args[:longitude]
    @timestamp = args[:timestamp]
  end

  def create_position
    position = Position.new(
      device_id: @device_id,
      latitude: @latitude,
      longitude: @longitude,
      timestamp: @timestamp
    )
    
    osmApi = AddressService.new(@latitude, @longitude).retrieve_address

    if position.save
      { data: { position: position, address: osmApi[:data] } }
    else
      { error: "Error creating position."}
    end
  end
end