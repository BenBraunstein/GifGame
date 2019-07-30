class GameForm < ApplicationRecord
    has_many :games
    has_many :users, through: :games
    has_many :game_questions
    
    def questions
        self.game_questions.collect{|game_question| game_question.question}
    end



end