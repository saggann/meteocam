class CreateUserFollowDevices < ActiveRecord::Migration
  def change
    create_table :user_follow_devices do |t|
      t.integer :user_id,   null: false
      t.integer :device_id, null: false

      t.timestamps
    end
    
    add_index :user_follow_devices, :user_id
    add_index :user_follow_devices, :device_id
    add_index :user_follow_devices, [:user_id, :device_id], unique: true
    
  end
end
