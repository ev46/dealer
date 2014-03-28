class AddSoldToCars < ActiveRecord::Migration
  def change
    add_column :cars, :sold, :boolean, :default => false
  end
end
