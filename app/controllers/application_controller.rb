class ApplicationController < ActionController::Base
 
  helper_method :display_prompt
  helper_method :display_choice
  helper_method :randomize_choices

  def display_prompt(game, question)

    case game.game_form.style
    when "syn"
        "<img src='#{question.gif}' height='250' width='250'>"
    end

  end

  def display_choice(game, choice)

    case game.game_form.style
    when "syn"
        "#{choice}"
    end

  end

  def randomize_choices(game, question)

    case game.game_form.style
    when "syn"
        [question.a, question.w1, question.w2, question.w3].shuffle
    end

  end
end
