class CreateQuestionMovs < ActiveRecord::Migration[5.2]
  def change
    create_table :question_movs do |t|
      t.string :gif
      t.string :a
      t.string :w1
      t.string :w2
      t.string :w3

      t.timestamps
    end
  end
end
