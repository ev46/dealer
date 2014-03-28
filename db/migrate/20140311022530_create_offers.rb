class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :email
      t.integer :amount
      t.boolean :respond, :default => false
      t.integer :car_id

      t.timestamps
    end
    add_index :offers, :car_id
  end
end
