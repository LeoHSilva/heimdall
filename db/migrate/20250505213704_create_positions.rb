class CreatePositions < ActiveRecord::Migration[8.0]
  def change
    create_table :positions do |t|
      t.references :device, null: false, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.datetime :timestamp

      t.timestamps
    end
  end
end
