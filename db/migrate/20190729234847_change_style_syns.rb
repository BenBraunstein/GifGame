class ChangeStyleSyns < ActiveRecord::Migration[5.2]
  def change
    rename_table :style_syns, :question_syns
  end
end
