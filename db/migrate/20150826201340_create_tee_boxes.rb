class CreateTeeBoxes < ActiveRecord::Migration
  def change
    create_table :tee_boxes do |t|
      t.string :color
      t.decimal :course_rating
      t.integer :course_slope
      t.integer :total_yardage_dirty

      t.references :tee_box_type, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
