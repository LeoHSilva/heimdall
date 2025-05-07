# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Device.destroy_all

# Create multiple Tracker Devices
devices = Device.create!([
  { name: "Device A", device_type: "GPS Tracker", status: "active" },
  { name: "Device B", device_type: "Bluetooth Tracker", status: "inactive" },
  { name: "Device C", device_type: "WiFi Tracker", status: "active" }
])

puts "Seed data created successfully!"