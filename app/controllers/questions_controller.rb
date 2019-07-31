
class QuestionsController < ApplicationController

    def analytics

        @popularity_pairs = Game.popularity
        @difficulty_hash = GameAnswer.difficulty
        render 'question/analytics'
    end

end