class UsersController < ApplicationController
  #before_filter :authenticate_user!
  before_filter :auth_admin!, except: [:show]

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  private
  def auth_admin!
  		redirect_to root_path unless (current_user && current_user.admin?)
  	end

end
