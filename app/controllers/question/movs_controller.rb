class Question::MovsController < ApplicationController
    def index
      @questions = QuestionMov.all
    end
  
    def show
      @question = QuestionMov.find(params[:id])
    end
  
    def new
  
    end
  
    def destroy
  
    end
    
  end 