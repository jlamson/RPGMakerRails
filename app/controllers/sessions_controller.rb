class SessionsController < ApplicationController
  def new
    redirect_to root_url, alert: "You are already Logged in, please log out first if you'd like to log in as another user" if session[:user_id] 
  end

  def create
    if user = User.authenticate(params[:username], params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid username and/or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged Out"
  end
end
