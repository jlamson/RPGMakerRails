require_relative 'controller_helpers'

class AdminController < ApplicationController
  def index
    return if redirect_if_not_logged_in
    @user = User.find_by_id(session[:user_id])
    @systems = System.find_all_by_user_id(session[:user_id])
  end
end