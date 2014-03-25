class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :uid
      t.string :name
      t.timestamps
    end
  end
end
