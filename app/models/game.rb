class Game < ApplicationRecord
    belongs_to :user
    belongs_to :game_form
    has_many :game_answers

    def possible_types
        []
    end
end