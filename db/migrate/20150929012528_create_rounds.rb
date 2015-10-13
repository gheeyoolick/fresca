class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.date :round_date

      t.references :round_type, index: true, foreign_key: true
      t.references :tournament, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
      
      t.references :round_type, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
