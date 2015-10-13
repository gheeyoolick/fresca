class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.decimal :handicap, default: 0
      t.string :email
      t.text :notes
      t.string :username
      t.string :password

      t.timestamps null: false
    end
  end
end
