class TournamentPlayer < ActiveRecord::Base

  validates :tournament_handicap, presence: true

  belongs_to :player
  belongs_to :tournament

  has_many :tournament_player_rounds, :dependent => :destroy
  has_many :rounds, :through => :tournament_player_rounds
  has_many :team_players, :dependent => :destroy
  
  default_scope {joins(:player).order('players.last_name DESC, players.first_name DESC')}

end
