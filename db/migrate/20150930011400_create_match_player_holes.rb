class CreateMatchPlayerHoles < ActiveRecord::Migration
  def change
    create_table :match_player_holes do |t|

      t.integer :natural_score, default: 0
      t.integer :handicap_modifier, default: 0
      t.boolean :played, default: false

      t.references :match_player, index: true, foreign_key: true
      t.references :hole, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
