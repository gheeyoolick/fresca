class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :phone_number
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.integer :number_of_holes, default: 18
      t.boolean :par3, default: false

      t.timestamps null: false
    end
  end
end
