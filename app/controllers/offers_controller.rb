class OffersController < ApplicationController

	def create
	
		@offer = Car.find(offer_params[:car_id]).offers.build(offer_params)
		@message = 'Offer submitted, we will answer you using the email you provided.'
		respond_to do |format|
			if @offer.save
				format.js
				format.html {redirect_to root_path}
			else
				@message = 'Your offer was not accepted, there was a higher offer or miminum was not met.'
				format.js
				format.html {redirect_to root_path}
			end
		end
	end

	def reject

		@offer = Offer.find(offer_params[:id])

		if offer_params[:archive]
			# archive, TBI
		else

			@offer.rejected = true
			@offer.counter = 0
			@offer.respond = false
			respond_to do |format|
				if @offer.save
					format.js
					format.html { redirect_to car_offers_path(@offer.car_id)}
				else
					format.js
					format.html { redirect_to car_offers_path(@offer.car_id)}
				end
			end
		end
	end

	def accept
		@offer = Offer.find(offer_params[:id])
		@offer.respond = true
		@offer.counter = offer_params[:counter_amount]
		respond_to do |format|
			if @offer.save
				format.js
				format.html { redirect_to car_offers_path(@offer.car_id)}
			else
				format.js
				format.html { redirect_to car_offers_path(@offer.car_id)}
			end
		end
	end


	private
	def list_params
		params.permit(:page)
	end
 	def offer_params
 		params.permit(:email, :amount, :car_id, :id, :counter_amount, :archive)
 	end
end
