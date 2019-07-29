class GameForm < ApplicationRecord
    has_many :games
    has_many :users, through: :games
    has_many :game_questions

    def title
        GameForm.game_types.find{|type| type[:style] == self.style}[:name]
    end

    def self.game_types
        [{ style: "syn", name: "The Synonym Game", description: "Here's a short blurb about how to play the game!" }]
    end

    

end