class CreateDevices < ActiveRecord::Migration[8.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :device_type
      t.string :status

      t.timestamps
    end
  end
end
