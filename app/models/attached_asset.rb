class AttachedAsset < ActiveRecord::Base
	belongs_to :attachable, :polymorphic => true
	has_attached_file :avatar, :styles => {:large => "800x800>", :medium => "300x300>", :small => "100x100>"}
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\z/
end
