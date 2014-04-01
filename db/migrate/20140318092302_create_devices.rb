class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :uid
      t.string :name
      t.timestamps
    end
    
    
    add_index :devices, :uid,              unique: true
    
  end
end
