
class Question::MatsController < ApplicationController
  def index
    @questions = QuestionMat.all
  end

  def show
    @question = QuestionMat.find(params[:id])
  end

  def new
  end

  def destroy
  end
end
