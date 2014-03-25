class CreateCameraPictures < ActiveRecord::Migration
  def change
    create_table :camera_pictures do |t|
      
      t.integer :device_id
      t.datetime :timestamp
      t.string   :image

      t.timestamps
      
    end
  end
end
