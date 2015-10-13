class CreateTeeBoxTypes < ActiveRecord::Migration
  def change
    create_table :tee_box_types do |t|
      
      t.string :tee_box_type

      t.timestamps null: false
    end
  end
end
