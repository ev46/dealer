class AddDiscountToCars < ActiveRecord::Migration
  def change
  	add_column :cars, :discount, :integer, :default => 200
  end
end
