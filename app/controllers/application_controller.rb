class ApplicationController < ActionController::Base
 
  helper_method :display_prompt
  helper_method :display_choice
  helper_method :randomize_choices
  helper_method :game_types
  helper_method :info

  def game_types
    ["syn"]
  end

  def info(style)

    case style
    when "syn"
        { style: "syn",
          name: "The Synonym Game",
          description: "Here's a short blurb about the game!",
          instructions: "Here are the full instrucitons for the game"}
    end
 
  end

  def display_prompt(style, question)

    case style
    when "syn"
        "<img src='#{question.gif}' height='250' width='250'>"
    end

  end

  def display_choice(style, choice)

    case style
    when "syn"
        "#{choice}"
    end

  end

  def randomize_choices(style, question)

    case style
    when "syn"
        [question.a, question.w1, question.w2, question.w3].shuffle
    end

  end
end
