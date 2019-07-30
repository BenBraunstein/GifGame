class ApplicationController < ActionController::Base
 
  helper_method :display_prompt
  helper_method :display_choice
  helper_method :randomize_choices
  helper_method :game_types
  helper_method :info

  def game_types
    ["syn", "dog", "mov", "mat"]
  end

  def info(style)

    case style
    when "syn"
        { style: "syn",
          name: "The Synonym Game",
          description: "Guess the word that searched for a gif!",
          instructions: "Each question is answered with one of four synonyms. Guess which synonym generated that question's gif!"}
    when "dog"
        { style: "dog",
          name: "The Dog Breed Game",
          description: "Test your knowledge of dog breeds!",
          instructions: "For each gif, choose the breed of the dog featured in that gif!"}
    when "mov"
        { style: "mov",
          name: "The Movie Game",
          description: "Test your movie knowledge!",
          instructions: "For each gif, choose the movie that that gif comes from!"}
    when "mat"
        { style: "mat",
          name: "The Matching Game",
          description: "Figure out which gif goes with the others!",
          instructions: "Each question has a collection of three related gifs. You have to decide which of two futher gifs goes best with the first three!"}
    end
 
  end

  def display_prompt(style, question)

    case style
    when "syn"
        "<img src='#{question.gif}' height='250' width='250'>"
    when "dog"
      "<img src='#{question.gif}' height='250' width='250'>"
    when "mov"
      "<img src='#{question.gif}' height='250' width='250'>"
    when "mat"
      "<img src='#{question.gif1}' height='250' width='250'><img src='#{question.gif2}' height='250' width='250'><img src='#{question.gif3}' height='250' width='250'>"
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
        "<img src='#{choice}' height='250' width='250'>"
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
        [question.agif, question.wgif].shuffle
    end

  end
end
