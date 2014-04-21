class OfferMailer < ActionMailer::Base
	default :from => "notifications@#{ENV['DOMAIN']}"

	def accept(offer)
		@offer = offer
		@car = Car.find(offer.car_id)
		mail(:to => @offer.email, :subject => "Offer Accepted")
	end

	def reject(offer)
		@offer = offer
		@car = Car.find(offer.car_id)
		mail(:to => @offer.email, :subject => "Offer Rejected")
	end

	def counter(offer)
		@offer = offer
		@car = Car.find(offer.car_id)
		mail(:to => @offer.email, :subject => "Counter Offer")
	end

end