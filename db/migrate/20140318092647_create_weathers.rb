class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      
      t.integer :device_id
      t.datetime :timestamp
      t.float :temperature
      t.float :pressure

      t.timestamps
    end
  end
end
