class SorceryCore < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.index :email, unique: true
      t.rename :password, :crypted_password
      t.string :salt
    end
  end
end