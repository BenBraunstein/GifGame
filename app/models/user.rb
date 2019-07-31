class User < ApplicationRecord
    has_many :games

    def played?(game_form)
        self.games.collect{|game| game.game_form}.include? game_form
    end
    
end
 