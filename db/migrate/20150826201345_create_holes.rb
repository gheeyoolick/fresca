class CreateHoles < ActiveRecord::Migration
  def change
    create_table :holes do |t|
      t.integer :hole_number
      t.integer :par_mens
      t.integer :par_ladies
      t.integer :yardage
      t.integer :handicap_mens
      t.integer :handicap_ladies
      t.references :tee_box, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
