class WelcomeController < ApplicationController
  before_filter :authenticate_user!, only: :user_listing
  def index
  end
  def show
    render :index
  end
  def user_listing
    if user_signed_in?
   	  @users = User.all.reject{ |e| current_user.friends.include? e }.reject {|user| user == current_user}
  	end
  end  
end
