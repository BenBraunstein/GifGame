class ChangeGameQuestions < ActiveRecord::Migration[5.2]
  def change
    rename_column :game_questions, :style_id, :question_id
    rename_column :game_questions, :style_type, :question_type
  end
end
