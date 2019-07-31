class GameAnswer < ApplicationRecord
  belongs_to :game
  belongs_to :game_question

  def question
    self.game_question.question
  end

  def correct?
    self.question.a == self.choice
  end

  def self.difficulty
    hash = self.all.each_with_object({}) do |answer, hash|
      style = answer.game.game_form.style
      hash[style] = {correct: 0, total: 0} if !hash.keys.include?(style)
      hash[style][:total] += 1
      hash[style][:correct] += 1 if answer.correct?
    end
  end
  
end 
