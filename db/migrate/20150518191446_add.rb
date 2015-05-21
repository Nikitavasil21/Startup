class Add < ActiveRecord::Migration
  def change
    change_table :decks do |t|
      t.string :name

      add_index :user_id
    end
  end
end