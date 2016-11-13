class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|

      t.integer :team_1_total_points_awarded, default: 0 #only updated once a match is completed
      t.integer :team_2_total_points_awarded, default: 0 #only udated once a match is completed
      t.integer :played_through_hole, default: 0;
      t.boolean :started, default: false
      t.boolean :complete, default: false

      t.references :round, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
