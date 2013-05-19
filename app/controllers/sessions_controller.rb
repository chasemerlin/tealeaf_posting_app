class SessionsController < ApplicationController

#GET /login
def new
end

#POST /login
def create
	user = User.where(email: params[:email]).first
	if user
		if user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:notice] = "Logged In!"
			redirect_to root_path
		else
			flash[:error] = "Incorrect Password"
			redirect_to login_path
		end
	else
		flash[:error] = "Name doesn't exist"
		redirect_to login_path
	end
end

def destroy 
	session[:user_id] = nil
	session[:notice] = "Logged Out"
	redirect_to root_path
end

end