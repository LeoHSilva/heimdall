class DevicesService < ApplicationService
  def initialize(args = {})
    @device_id = args[:device_id]
  end

  def all
    query = Device.all
    if query
      { data: query }
    else
      { error: "Error retrieving all devices"}
    end
  end

  def create(args)
    device = Device.new(
      name: args[:name],
      device_type: args[:device_type],
      status: args[:status]
    )

    if device.save
      { data: device}
    else
      { error: "Error creating device." }
    end
  end

  def info
    query = Device.includes(positions: :address).find_by(id: @device_id)
    if query
      device = query.as_json(include: { positions: { include: {address: {except: [:id, :created_at, :updated_at, :latitude, :longitude]}}, except: [:id, :created_at, :updated_at] }})
      { data: device }
    else
      { error: "Device Not Found."}
    end

  end

  def update(args)
    device = Device.find_by(id: @device_id)
    if device
      if device.update(args)
        { data: device }
      else
        { error: "Error updating device." }
      end
    else
      { error: "Device Not Found." }
    end
  end

  def delete
    device = Device.find_by(id: @device_id)
    if device
      device.destroy
      { data: "Device successfully deleted." }
    else
      { error: "Device Not Found." }
    end
  end
end