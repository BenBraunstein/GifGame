class GamesController < ApplicationController

  
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


  def answers
    @user = User.find(params[:user_id])
    @game = Game.find(params[:game_id])

    @game.game_form.game_questions.each_with_index do |game_question, index|
      GameAnswer.create(game_id: @game.id, game_question_id: game_question.id, choice: params["#{index+1}"])
    end

    @game.update(complete?: true)
    render :show
  end


end 
