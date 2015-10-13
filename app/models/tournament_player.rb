class TournamentPlayer < ActiveRecord::Base

  validates :tournament_handicap, presence: true

  belongs_to :player
  belongs_to :tournament

  has_many :tournament_player_rounds, :dependent => :destroy
  has_many :rounds, :through => :tournament_player_rounds

  has_one :team_player, :dependent => :destroy
  has_one :team, :through => :team_player

end
