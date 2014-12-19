class AttachedAsset < ActiveRecord::Base
	belongs_to :attachable, :polymorphic => true
	has_attached_file :avatar, :styles => {:large => "800x600!", :medium => "400x300!", :small => "100x70!"}, 
	:path => "avatars/:class/:id.:style.:extension"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\z/
end
