class GameQuestion < ApplicationRecord
  belongs_to :game_form
  belongs_to :question, polymorphic: true

  



end
