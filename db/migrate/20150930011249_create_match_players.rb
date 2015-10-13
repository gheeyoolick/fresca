class CreateMatchPlayers < ActiveRecord::Migration
  def change
    create_table :match_players do |t|
      
      t.decimal :handicap, default: 0
      
      t.references :match, index: true, foreign_key: true
      t.references :team_player, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
