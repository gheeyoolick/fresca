class CreateHoles < ActiveRecord::Migration
  def change
    create_table :holes do |t|
      t.integer :hole_number
      t.integer :par
      t.integer :yardage
      t.integer :handicap
      t.references :tee_box, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
