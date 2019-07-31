class AddSearchTermToQuestionMat < ActiveRecord::Migration[5.2]
  def change
    add_column :question_mats, :search_term, :string
  end
end
