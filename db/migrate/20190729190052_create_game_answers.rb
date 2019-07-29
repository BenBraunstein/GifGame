class CreateGameAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :game_answers do |t|
      t.belongs_to :game, foreign_key: true
      t.belongs_to :game_question, foreign_key: true
      t.string :choice

      t.timestamps
    end
  end
end
