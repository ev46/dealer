class HomeController < ApplicationController

	skip_before_filter :authenticate_user!

	def index
		@makes = Car.makes.insert(0,"ALL")

		if cars_params[:search].nil? || cars_params[:search][:make] == "ALL"
			@cars = Car.all.order("sold").page(cars_params[:page]).per(9)
		else
			@cars = Car.by_make(cars_params[:search][:make]).order("sold").page(cars_params[:page]).per(9)
		end
		
	end

	def about
		@store = Store.first
	end


	private
 	def cars_params
 		params.permit(:page, :search => [:make])
 	end

 	def search_params
 		params.require(:search).permit(:page, :make, :utf8)
 	end


end
