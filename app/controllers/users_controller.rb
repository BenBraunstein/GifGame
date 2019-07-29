class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    user = User.create(strong_user_params)
    redirect_to user_path(user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(strong_user_params)
    redirect_to user_path(user)
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def destroy
  end

  private

  def strong_user_params
    {
      username: params[:user][:username],
      password_digest: params[:user][:password],
      admin?: false,
    }
  end
end
