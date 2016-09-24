class RegistrationsController < Devise::RegistrationsController
def new
    super
  end

  def create
  	super
    # add custom create logic here
  end

  def update
    super
  end

  def edit
  	super
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :profile_image)
  end

  def account_update_params
    params.require(:user).permit(:profile_image, :email, :password, :password_confirmation, :current_password)
  end
end