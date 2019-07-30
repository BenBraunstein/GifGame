class Question::DogsController < ApplicationController
    def index
      @questions = QuestionDog.all
    end
  
    def show
      @question = QuestionDog.find(params[:id])
    end
  
    def new
  
    end
  
    def destroy
  
    end
    
  end 