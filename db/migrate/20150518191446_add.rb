class Add < ActiveRecord::Migration
  def change
    change_table :decks do |t|
      t.string :name
    end
  end
end