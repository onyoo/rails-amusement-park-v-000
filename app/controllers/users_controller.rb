class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    set_session(@user)
    redirect_to user_path(@user)
  end

  def edit
  end

  def update

  end

  def show
    @user = User.find(params[:id])
  end

  def index

  end

private

  def user_params
    params.require(:user).permit(:name, :tickets, :nausea, :happiness, :height, :admin)
  end

end
