class AddMilesToCars < ActiveRecord::Migration
  def change
    add_column :cars, :miles, :integer, :default => 0
  end
end
