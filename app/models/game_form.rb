class GameForm < ApplicationRecord
    has_many :games
    has_many :users, through: :games
    has_many :game_questions

    

end