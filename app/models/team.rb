class Team < ActiveRecord::Base

  validates :name, presence: true
  validates :team_number, presence: true

  belongs_to :tournament
  has_many :team_players, :dependent => :destroy
  has_many :tournament_players, :through => :team_players

  def self.get_eligible_players (tournament_id, team_id)
    puts "LOOKIE: Inside get eligible players"
    tournament = Tournament.find(tournament_id)
    puts "LOOKIE: Tournament Id:"+tournament.id.to_s
    player_array = []
    players_added = false
    tournament.teams.each do |team|
      puts "LOOKIE: Inside Team Loop for Tournament "+tournament.id.to_s+" Team "+team.team_number.to_s
      team.team_players.each do |team_player|
        puts "LOOKIE: Inside Player Loop for Team "+team.team_number.to_s
        players_added = true
        if team_player.team_id != team_id
          player_array.push(team_player.tournament_player_id)
          puts player_array.to_s
        end
      end
    end
    if players_added
      puts "LOOKIE: Inside Players Added - player_array"
      tournament_players = TournamentPlayer.where("tournament_id = ? AND tournament_players.id NOT IN (?)", tournament_id, player_array)
    else
      tournament_players = TournamentPlayer.where(tournament_id: tournament_id)
    end
    tournament_players

  end

  def self.get_next_team_number (tournament_id)
    team = Team.where("tournament_id = ?", tournament_id).order("team_number DESC").take

    if team==nil
      1
    else
      puts "Max Team Number is" + team.team_number.to_s
      team.team_number + 1
    end
  end

end
