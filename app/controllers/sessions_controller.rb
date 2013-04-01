class SessionsController < ApplicationController
  def new
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
    redirect_to pages_url, notice: "logged out"
  end
end
