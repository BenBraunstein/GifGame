class GameAnswer < ApplicationRecord
  belongs_to :game
  belongs_to :game_question

  def question
    self.game_question.style
  end

  def correct?
    self.question.a == self.choice
  end
end
