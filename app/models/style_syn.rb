class StyleSyn < ApplicationRecord
    has_many :game_questions, as: :style
end
 