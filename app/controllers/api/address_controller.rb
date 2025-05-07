class Api::AddressController < ApplicationController
  def show 
    osmApi = AddressService.new(params[:latitude], params[:longitude]).retrieve_address
     
    if osmApi[:data]
      render json: { response: osmApi[:data] }
    else
      render json: { error: "Error creating position." }
    end
  end

  private

    def position_params
      params.permit([
        :latitude,
        :longitude
      ])
    end
end