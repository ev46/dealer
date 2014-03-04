class CreateAttachedAssets < ActiveRecord::Migration
  def change
    create_table :attached_assets do |t|

      t.timestamps
      t.references :attachable, polymorphic: true
    end
    add_attachment :attached_assets, :avatar

  end
end
