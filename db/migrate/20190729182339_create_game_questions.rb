class CreateGameQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :game_questions do |t|
      t.belongs_to :game_form, foreign_key: true
      t.integer :style_id
      t.string :style_type

      t.timestamps
    end
    add_index :game_questions, [:style_id, :style_type]
    #Ex:- add_index("admin_users", "username")
  end
end
