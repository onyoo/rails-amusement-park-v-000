class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end

  def create
    session[:user_id] = params[:user][:id].to_i
    redirect_to user_path(current_user)
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
