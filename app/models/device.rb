class Device < ApplicationRecord
  has_many :positions, dependent: :destroy
end
