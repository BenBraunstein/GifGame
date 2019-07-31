class Game < ApplicationRecord
    belongs_to :user
    belongs_to :game_form
    has_many :game_answers

    

    def self.recent_games_by_others(user)
        Game.all.select{|game| game.complete? && game.user != user && !user.played?(game.game_form)}
        .sort_by{|game| game.updated_at}.reverse[0, 9]
    end

    def self.popularity
        # Pairs of style and number of games with that style
        self.all.group_by{|game| game.game_form.style}.to_a.collect{|pair| [pair[0], pair[1].length]}.sort_by{|pair| -pair[1]}
    end

    
end