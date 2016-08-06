class CreateTournamentPlayerHoles < ActiveRecord::Migration
  def change
    create_table :tournament_player_holes do |t|
      t.integer :natural_score, default: 0
      t.integer :strokes_given, default: 0
      t.integer :points_awarded, default: 0
      t.boolean :played, default: false

      t.references :tournament_player_round, index: true, foreign_key: true
      t.references :hole, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
