class Question::SynsController < ApplicationController
  def index
    @questions = QuestionSyn.all
  end

  def show
    @question = QuestionSyn.find(params[:id])
  end

  def new

  end

  def destroy

  end
  
end 
