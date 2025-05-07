class Api::DevicesController < ApplicationController
  def index
    allDevices = DevicesService.new.all
    
    if allDevices[:data]
      render json: { devices: allDevices[:data] }, status: 200
    else
      render json: { error: allDevices[:error] }
    end
  end

  def create
    device = DevicesService.new.create(device_params)

    if device[:data]
      render json: device[:data], status: 200
    else
      render json: { error: device[:error]}
    end
  end

  def show
    device = DevicesService.new({device_id: params[:id]}).info

    if device[:data]
      render json: { device: device[:data] }, status: 200
    else
      render json: { error: device[:error] }
    end
  end

  def update
    device = DevicesService.new({device_id: params[:id]}).update(device_params)
    
    if device[:data]
      render json: { device: device[:data] }, status: 200
    else
      render json: { error: device[:error] }
    end
  end

  def destroy
    device = DevicesService.new({device_id: params[:id]}).delete

    if device[:data]
      render json: { device: device[:data] }, status: 200
    else
      render json: { error: device[:error] }
    end
  end

  private
    def device_params
      params.require(:device).permit([
        :name,
        :device_type,
        :status,
      ])
    end
end
