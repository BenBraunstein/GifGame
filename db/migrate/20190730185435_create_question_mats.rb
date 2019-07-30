class CreateQuestionMats < ActiveRecord::Migration[5.2]
  def change
    create_table :question_mats do |t|
      t.string :gif1
      t.string :gif2
      t.string :gif3
      t.string :agif
      t.string :wgif

      t.timestamps
    end
  end
end
