class CreateGameForms < ActiveRecord::Migration[5.2]
  def change
    create_table :game_forms do |t|
      t.string :style

      t.timestamps
    end
  end
end
