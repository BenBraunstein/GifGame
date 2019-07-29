class GameQuestion < ApplicationRecord
  belongs_to :game_form
  belongs_to :style, polymorphic: true
end
