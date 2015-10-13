class Team < ActiveRecord::Base

  validates :name, presence: true
  validates :team_number, presence: true

  belongs_to :tournament
  has_many :team_players, :dependent => :destroy
  has_many :tournament_players, :through => :team_players
  #has_many :team_holes, :dependent => :destroy
  #has_many :holes, :through => :team_holes

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
