class Position < ApplicationRecord
  belongs_to :device
  has_one :address, primary_key: [:latitude, :longitude], foreign_key: [:latitude, :longitude]
end
