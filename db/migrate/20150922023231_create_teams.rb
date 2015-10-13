class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :team_number
      
      t.references :tournament, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
