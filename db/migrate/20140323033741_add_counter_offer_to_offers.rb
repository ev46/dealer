class AddCounterOfferToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :counter, :integer
    add_column :offers, :rejected, :boolean, :default => false
  end
end
