class HomeController < ApplicationController
	def index
		@cars = Car.all.order("sold").page(cars_params[:page]).per(6)
	end


	private
 	def cars_params
 		params.permit(:page)
 	end
end
