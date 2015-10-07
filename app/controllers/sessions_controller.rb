class SessionsController < ApplicationController
	def create # login
		user = Users.find_by(email: session_params[:email])
		if user
			if user.authenticate(session_params[:password])
				session[:user_id] = user.id
				redirect_to "/dashboard"
			else
				flash[:error] = "Invalid Login" #bad password
				redirect_to "/"
			end
		else
			flash[:error] = "Invalid Login" #bad email
			redirect_to "/"
		end
	end
	def destroy #logout
		session[:user_id] = nil #reset_session
		redirect_to "/"
	end
	private
	def session_params
		params.require(:user).permit(:email, :password)
	end
end
