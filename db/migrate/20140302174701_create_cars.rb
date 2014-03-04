class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.boolean :two_door
      t.integer :year
      t.string :make
      t.string :model
      t.string :vin
      t.integer :price
      t.string :warranty

      t.timestamps
    end
  end
end
