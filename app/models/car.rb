class Car < ActiveRecord::Base
	has_many :attached_assets, :as => :attachable, :dependent => :destroy
	has_many :offers, :dependent => :destroy
	accepts_nested_attributes_for :attached_assets, :allow_destroy => true

	scope :by_make, ->(make) {
		where('make ILIKE ?', make)
	}

	def self.makes
		Car.select(:make).map(&:make).uniq
	end
end
