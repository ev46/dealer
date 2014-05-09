class AddCarsPerPageToStores < ActiveRecord::Migration
  def change
    add_column :stores, :cars_per_page, :integer, :default => 9
  end
end
