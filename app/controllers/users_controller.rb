class UsersController < ApplicationController
  def show
	sign_out :user
	redirect_to welcome_index_path
  end
end
