class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.date :round_date
      t.integer :round_number, default: 0
      t.boolean :track_player_hole_scores, default: false
      t.boolean :started, default: false
      t.boolean :complete, default: false

      t.references :round_type, index: true, foreign_key: true
      t.references :tournament, index: true, foreign_key: true
      t.references :tee_box, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
