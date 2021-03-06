class ApplicationController < ActionController::Base
  helper_method :display_prompt
  helper_method :display_choice
  helper_method :randomize_choices
  helper_method :game_types
  helper_method :info
  helper_method :logged_in?
  helper_method :current_user
  helper_method :authorized?
  helper_method :authorized_admin?
  helper_method :correct_user?

  def game_types
    ["syn", "dog", "mov", "mat"]
  end

  def info(style)
    case style
    when "syn"
      { style: "syn",
        name: "The Synonym Game",
        description: "Guess the word that searched for a gif!",
        instructions: "Each question is answered with one of four synonyms. Guess which synonym generated that question's gif!" }
    when "dog"
      { style: "dog",
        name: "The Dog Breed Game",
        description: "Test your knowledge of dog breeds!",
        instructions: "For each gif, choose the breed of the dog featured in that gif!" }
    when "mov"
      { style: "mov",
        name: "The Movie Game",
        description: "Test your movie knowledge!",
        instructions: "For each gif, choose the movie that that gif comes from!" }
    when "mat"
      { style: "mat",
        name: "The Matching Game",
        description: "Guess the least popular gif!",
        instructions: "Each set of gifs was generated from a single seach term. Choose the gif that was the least popular result for that search term."}
    end
  end

  def display_prompt(style, question)
    case style
    when "syn"
      "<img src='#{question.gif}' >"
    when "dog"
      "<img src='#{question.gif}' >"
    when "mov"
      "<img src='#{question.gif}' >"
    when "mat"
      "<h4 style='color:white; text-align:center'>Search: #{question.search_term}</h4>"
    end
  end

  def display_choice(style, choice)
    case style
    when "syn"
      "#{choice}"
    when "dog"
      "#{choice}"
    when "mov"
      "#{choice}"
    when "mat"
      "<img src='#{choice}' width='400px'>"
    end
  end

  def randomize_choices(style, question)
    case style
    when "syn"
      [question.a, question.w1, question.w2, question.w3].shuffle
    when "dog"
      [question.a, question.w1, question.w2, question.w3].shuffle
    when "mov"
      [question.a, question.w1, question.w2, question.w3].shuffle
    when "mat"
      [question.a, question.w1, question.w2, question.w3].shuffle
    end
  end

  def logged_in?
    current_user
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      false
    end
  end

  def authorized?
    redirect_to "/" unless logged_in?
  end

  def authorized_admin?
    if logged_in?
      redirect_to "/" unless current_user.admin?
    end
  end

  def correct_user?

    if params[:user_id]
      @user = User.find(params[:user_id])
    elsif params[:id]
      @user = User.find(params[:id])
    end
    redirect_to '/' unless @user == current_user
  end
end
