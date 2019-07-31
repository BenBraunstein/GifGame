
class QuestionsController < ApplicationController

    before_action :authorized?
    before_action :authorized_admin?

    def analytics
        @popularity_pairs = Game.popularity
        @difficulty_hash = GameAnswer.difficulty
        render 'question/analytics'
    end

end