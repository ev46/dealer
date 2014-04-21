class Offer < ActiveRecord::Base
	validate :validate_amount, :on => :create
	belongs_to :car
	delegate :price, :discount, :to => :car
	default_scope { where(archived: false) }
	scope :archived, -> { where(archived: true) }




	def minimum
		self.price - self.discount
	end

	

	def validate_amount
		if amount < minimum
			errors.add :base, "Offer not accepted"
			return false
		else
			return true
		end
	end
end
