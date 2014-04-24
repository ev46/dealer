class OffersController < ApplicationController

	skip_before_filter :authenticate_user!, only: [:create]
	before_filter :auth_admin!, except: [:create]

	def create
	
		@offer = Car.find(offer_params[:car_id]).offers.build(offer_params)
		@message = "Offer submitted for review, expect an email response soon, thank you!"
		respond_to do |format|
			if @offer.save
				format.js
				format.html {redirect_to root_path}
			else
				@message = "Your offer was NOT accepted, consider increasing it."
				format.js
				format.html {redirect_to root_path}
			end
		end
	end

	def show
		@offer = Offer.find(offer_params[:id])
	end

	def reject

		@offer = Offer.find(offer_params[:id])

		if offer_params[:archive]
			@archive = true
			@offer.archived = true
			respond_to do |format|
				if @offer.save
					format.js
					format.html { redirect_to car_offers_path(@offer.car_id)}
				else
					format.js
					format.html { redirect_to car_offers_path(@offer.car_id)}
				end
			end
		else
			@offer.rejected = true
			@offer.counter = 0
			@offer.respond = false
			respond_to do |format|
				if @offer.save
					OfferMailer.reject(@offer).deliver
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
		#depending on which form is submitting the counter
		if offer_params[:offer][:counter]
			@offer.counter = offer_params[:offer][:counter]
		else
			@offer.counter = offer_params[:counter_amount]
		end



		respond_to do |format|
			if @offer.save
				if @offer.counter.present?
					OfferMailer.counter(@offer).deliver
				else
					OfferMailer.accept(@offer).deliver
				end
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
		params.permit(:id, :page)
	end
 	def offer_params
 		params.permit(:email, :amount, :car_id, :id, :counter_amount, :archive, :offer => [:counter])
 	end

 	def auth_admin!
  		redirect_to root_path unless (current_user && current_user.admin?)
  	end
end
