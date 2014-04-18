class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      
      # If a user owns a webcam
      t.integer :user_id
      
      # If the webcam is public
      t.boolean :public, default: false, null: false
      
   
      t.string :uid, null: false
      t.string :name, default: "unnamed"
      
      t.timestamps
      
    end
    
    
    add_index :devices, :uid,              unique: true
    
    
  end
end
