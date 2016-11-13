class Tournament < ActiveRecord::Base

  validates :title, presence: true
  validates :tournament_date, presence: true
	validates :location, presence: true

  belongs_to :tournament_type

  has_many :rounds, :dependent => :destroy
  accepts_nested_attributes_for :rounds
  validates_associated :rounds

  has_many :tournament_players, :dependent => :destroy
  has_many :players, :through => :tournament_players
  accepts_nested_attributes_for :tournament_players
  validates_associated :tournament_players

  has_many :teams, :dependent => :destroy

  def self.get_eligible_players (tournament_id)
    #tournament = Tournament.find(tournament_id)
    #player_array = []

    #tournament.tournament_players.each do |player|
    #  player_array.push(player.player_id)
    #`  puts player_array.to_s
    #end
    #players = Player.where.not(id: player_array)
    #players
    Player.all
  end

  def two_team? ()
    true
  end

end