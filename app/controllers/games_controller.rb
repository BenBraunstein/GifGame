class GamesController < ApplicationController
  before_action :authorized?
  before_action :correct_user?

  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @game = Game.find(params[:id])
    @users = User.all
  end

  def new
    @user = User.find(params[:user_id])
    @recent = Game.recent_games_by_others(@user)
  end

  def create
    @user = User.find(params[:user_id])
    game_form = GameForm.create(style: params[:style])
    @game = Game.create(user_id: params[:user_id], game_form_id: game_form.id, complete?: false)
    redirect_to user_game_path(@user, @game)
  end

  def create_with_form
    @user = User.find(params[:user_id])
    game_form = GameForm.find(params[:form_id])

    if @user.played?(game_form)
      redirect_to new_user_game_path(@user)
    else
      @game = Game.create(user_id: params[:user_id], game_form_id: game_form.id, complete?: false)
      redirect_to user_game_path(@user, @game)
    end
  end

  def answers
    @user = User.find(params[:user_id])
    @game = Game.find(params[:game_id])

    @game.game_form.game_questions.each_with_index do |game_question, index|
      GameAnswer.create(game_id: @game.id, game_question_id: game_question.id, choice: params["#{index + 1}"])
    end

    @game.update(complete?: true)
    redirect_to user_game_path(@user, @game)
  end
end
