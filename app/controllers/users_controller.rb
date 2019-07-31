class UsersController < ApplicationController

  before_action :authorized?, except: [:new, :create]
  before_action :correct_user?, only: [:edit, :update]

  def new
    @user = User.new()
  end

  def create
    user = User.create(strong_user_params)
    session[:user_id] = user.id
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
      password: params[:user][:password],
      admin?: false
    }
  end
end
