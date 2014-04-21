class AddArchivedToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :archived, :boolean, :default => false
  end
end
