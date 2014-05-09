class StoreController < ApplicationController
	before_action :set_store, only: [:edit, :update]
	before_filter :auth_admin!

	# GET /store/edit
	def edit
		
	end
	# PUT /store
	def update
		 respond_to do |format|
		      if @store.update(store_params)
		        format.html { redirect_to edit_store_path, notice: 'Store was successfully updated.' }
		        format.json { head :no_content }
		      else
		        format.html { render action: 'edit' }
		        format.json { render json: @store.errors, status: :unprocessable_entity }
		      end
    	end
	end


	private

	def set_store
		@store = Store.last
	end 

	def store_params
		params.require(:store).permit(:name, :about, :cars_per_page, :email, :phone, :fax, :url, :address, :sun, :mon, :tus, :wed, :thr, :fri, :sat, :warranty, :url, :time_zone)
	end

	def auth_admin!
  		redirect_to root_path unless (current_user && current_user.admin?)
  	end

end