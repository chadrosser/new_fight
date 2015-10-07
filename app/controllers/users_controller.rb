class UsersController < ApplicationController
  def index
  end

  def create
  	new_user = Users.create(user_params)
  	if new_user.valid?
  		flash[:kitty] = "You have succesfully registered"
  		redirect_to "/"
  	else
  		flash[:errors] = new_user.errors.full_messages
  		redirect_to "/"
  	end
  end
  def show
    @user = User.find(params[:id])
  end
  private

  def user_params
  	params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation)
  end
end
