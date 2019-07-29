class Style::SynsController < ApplicationController
  def index
    @questions = StyleSyn.all
  end

  def show
    @question = StyleSyn.find(params[:id])
  end

  def new
    
  end

  def destroy
  end
end 
