class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.date :tournament_date
      t.string :title
      t.string :subtitle
      t.string :location
      t.boolean :handicap, default: false
      t.boolean :male_players, default: true
      t.boolean :female_players, default: false
      t.boolean :started, default: false
      t.boolean :complete, default: false
      
      t.references :tournament_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
