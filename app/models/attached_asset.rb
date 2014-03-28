class AttachedAsset < ActiveRecord::Base
	belongs_to :attachable, :polymorphic => true
	has_attached_file :avatar, :styles => {:large => "800x500!", :medium => "400x275!", :small => "100x70!"}
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\z/
end