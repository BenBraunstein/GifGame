class UsersController < ApplicationController

  before_action :authorized?, except: [:new, :create]
  before_action :correct_user?, only: [:edit, :update]

  def new
    @user = User.new()
  end

  def create

    user = User.new(strong_user_params)
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.now[:message] = user.errors.full_messages[0]
      @user = User.new()
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(strong_user_params)
      redirect_to user_path(user)
    else
      flash.now[:message] = user.errors.full_messages[0]
      render :edit
    end
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
