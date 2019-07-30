class QuestionMat < ApplicationRecord
    has_many :game_questions, as: :question
end
