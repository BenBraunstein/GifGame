class GamesController < ApplicationController
  helper_method :game_types

  def game_types
    [{ style: "syn", name: "The Synonym Game", description: "Here's a short blurb about how to play the game!" }]
  end

  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @game = Game.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    # Form should supply a user_id and style
    # Create game_form (automatically create the game questions)
    @game.create(user_id: params[:user_id], game_form_id: game_form.id, complete?: false)
  end
end 
