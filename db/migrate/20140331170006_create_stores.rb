class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :address
      t.string :sun, :default => "9AM - 6PM"
      t.string :mon, :default => "9AM - 6PM"
      t.string :tus, :default => "9AM - 6PM"
      t.string :wed, :default => "9AM - 6PM"
      t.string :thr, :default => "9AM - 6PM"
      t.string :fri, :default => "9AM - 6PM"
      t.string :sat, :default => "9AM - 6PM"
      t.text :about
      t.text :warranty, :default => "60 days powertrain parts and labor."
      t.string :time_zone, :default => "Eastern Time (US & Canada)"
      t.integer :phone, :limit => 5
      t.string :email
      t.integer :fax, :limit => 5
      t.string :url

      t.timestamps
    end
  end
end
