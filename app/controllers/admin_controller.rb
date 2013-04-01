class AdminController < ApplicationController
  def index
    return if redirect_if_not_logged_in
    @user = User.find_by_id(session[:user_id])
  end
end

private
def redirect_if_not_logged_in
  unless session[:user_id]
    redirect_to root_url, notice: "Please Login to use that function"
    return true
  end
  false
end

