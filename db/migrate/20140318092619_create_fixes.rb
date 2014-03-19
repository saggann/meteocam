class CreateFixes < ActiveRecord::Migration
  def change
    create_table :fixes do |t|
      
      t.integer :device_id
      t.datetime :timestamp
      t.float :longitude
      t.float :latitude
      t.float :altitude

      t.timestamps
    end
  end
end
