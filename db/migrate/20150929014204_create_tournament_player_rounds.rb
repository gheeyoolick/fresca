class CreateTournamentPlayerRounds < ActiveRecord::Migration
  def change
    create_table :tournament_player_rounds do |t|
      t.integer :total_natural_score
      t.integer :round_handicap_modifier
      
      t.references :round, index: true, foreign_key: true
      t.references :tournament_player, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
