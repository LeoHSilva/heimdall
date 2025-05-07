class Api::PositionsController < ApplicationController
  def create
    position = PositionsService.new(params[:position]).create_position
    
    if position[:data]
      render json: { response: position[:data] }, status: 200
    else
      render json: { error: "Error creating position." }
    end
  end

  private
    def position_params
      params.require(:position).permit([
        :device_id,
        :latitude,
        :longitude,
        :timestamp
      ])
    end
end
