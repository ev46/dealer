class AddSoonToCars < ActiveRecord::Migration
  def change
    add_column :cars, :soon, :boolean, :default => false
  end
end
