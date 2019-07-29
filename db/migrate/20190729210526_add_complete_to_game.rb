class AddCompleteToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :complete?, :boolean
  end
end
