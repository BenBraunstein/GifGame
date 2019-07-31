class CreateQuestionMats < ActiveRecord::Migration[5.2]
  def change
    create_table :question_mats do |t|
      t.string :w1
      t.string :w2
      t.string :w3
      t.string :a

      t.timestamps
    end
  end
end
