class CreateTournamentPlayerHoles < ActiveRecord::Migration
  def change
    create_table :tournament_player_holes do |t|
      t.integer :natural_score, default: 0
      t.integer :handicap_modifier, default: 0
      t.boolean :played, default: false

      t.references :tournament_player_round, index: true, foreign_key: true
      t.references :hole, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
