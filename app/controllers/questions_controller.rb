
class QuestionsController < ApplicationController

    def analytics

        @popularity_pairs = Game.popularity
        render 'question/analytics'
    end

end