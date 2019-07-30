class CreateQuestionDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :question_dogs do |t|
      t.string :gif
      t.string :a
      t.string :w1
      t.string :w2
      t.string :w3

      t.timestamps
    end
  end
end
