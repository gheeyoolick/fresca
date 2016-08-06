class CreateMatchHoles < ActiveRecord::Migration
  def change
    create_table :match_holes do |t|

      t.integer :team_1_natural_score, default: 0
      t.integer :team_1_strokes_given, default: 0
      t.integer :team_2_natural_score, default: 0
      t.integer :team_2_strokes_given, default: 0
      t.integer :team_1_points_awarded, default: 0
      t.integer :team_2_points_awarded, default: 0
      t.boolean :played, default: false

      t.references :hole, index: true, foreign_key: true
      t.references :match, index: true, foreign_key: true


      t.timestamps null: false
    end
  end
end
