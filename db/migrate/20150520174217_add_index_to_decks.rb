class AddIndexToDecks < ActiveRecord::Migration
  def change
    change_table :decks do |t|
      add_column :decks, :user_id, :integer, null: false
      add_index :decks, :user_id
    end
  end
end
