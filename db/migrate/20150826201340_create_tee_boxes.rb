class CreateTeeBoxes < ActiveRecord::Migration
  def change
    create_table :tee_boxes do |t|
      t.string :color
      t.decimal :mens_course_rating
      t.integer :mens_course_slope
      t.decimal :ladies_course_rating
      t.integer :ladies_course_slope
      t.integer :total_yardage_dirty

      t.references :tee_box_type, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
