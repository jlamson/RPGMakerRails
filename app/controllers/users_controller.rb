class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    return if redirect_if_not_logged_in

    @users = User.order(:username)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    return if redirect_if_not_logged_in

    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    return if redirect_if_specific_user_not_logged_in(params[:id])

    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(users_url, notice: "User #{@user.username} was successfully created") }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    return if redirect_if_specific_user_not_logged_in(params[:id])

    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(users_url, notice: "User #{@user.username} was successfully updated") }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    return if redirect_if_specific_user_not_logged_in(params[:id])

    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
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

  def redirect_if_specific_user_not_logged_in(user_id)
    return true if redirect_if_not_logged_in
    unless user_id == session[:user_id] 
      redirect_to users_url, notice: "You may only edit yourself (session=#{session[:user_id]}, passed=#{user_id})"
      return true
    end
    false
  end
end
