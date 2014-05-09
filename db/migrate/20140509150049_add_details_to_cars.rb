class AddDetailsToCars < ActiveRecord::Migration
  def change
    add_column :cars, :details, :text
  end
end
