class AttachedAssetsController < ApplicationController

	before_filter :auth_admin!

	def destroy
		@attached_asset = AttachedAsset.find(asset_params[:id])
		car_id = @attached_asset.attachable_id
		@remove_id = @attached_asset.id
		@attached_asset.destroy
		respond_to do |format|
			format.html {redirect_to edit_car_path(car_id)}
			format.js
		end
	end

	private

	def asset_params
      params.permit(:id)
    end

    def auth_admin!
  		redirect_to root_path unless (current_user && current_user.admin?)
  	end

end