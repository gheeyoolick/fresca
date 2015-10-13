class CreateTournamentTypes < ActiveRecord::Migration
  def change
    create_table :tournament_types do |t|
      t.string :tournament_type

      t.timestamps null: false
    end
  end
end
