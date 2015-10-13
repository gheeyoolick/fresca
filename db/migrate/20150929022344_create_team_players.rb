class CreateTeamPlayers < ActiveRecord::Migration
  def change
    create_table :team_players do |t|
      
      t.references :team, index: true, foreign_key: true
      t.references :tournament_player, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
