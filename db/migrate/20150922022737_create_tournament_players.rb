class CreateTournamentPlayers < ActiveRecord::Migration
  def change
    create_table :tournament_players do |t|
      
      t.decimal :tournament_handicap, default: 0
      
      default_scope joins(:player).order('players.last_name DESC, players.first_name DESC')
      
      t.references :player, index: true, foreign_key: true
      t.references :tournament, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
