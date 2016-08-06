class TournamentPlayerRound < ActiveRecord::Base

  validates :total_natural_score, presence: true
  validates :round_stokes_given, presence: true

  belongs_to :tournament_player
  belongs_to :round

  has_many :tournament_player_round_holes, :dependent => :destroy
  has_many :holes, :through => :tournament_player_round_holes

end
