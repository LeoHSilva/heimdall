class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :name
      t.string :category
      t.string :addresstype
      t.string :road
      t.string :suburb
      t.string :city_district
      t.string :city
      t.string :state
      t.string :postcode
      t.string :country

      t.timestamps
    end
  end
end
