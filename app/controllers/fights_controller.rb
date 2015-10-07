class FightsController < ApplicationController
  def index
  	@current_user = Users.find(session[:user_id])
  end



  def show
  end
end
