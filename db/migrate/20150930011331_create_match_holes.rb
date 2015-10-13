class CreateMatchHoles < ActiveRecord::Migration
  def change
    create_table :match_holes do |t|

      t.integer :team_1_natural_score, default: 0
      t.integer :team_1_handicap_modifier, default: 0
      t.integer :team_2_natural_score, default: 0
      t.integer :team_2_handicap_modifier, default: 0
      t.boolean :played, default: false

      t.references :hole, index: true, foreign_key: true
      t.references :match, index: true, foreign_key: true


      t.timestamps null: false
    end
  end
end
