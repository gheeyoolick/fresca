class TournamentPlayerHole < ActiveRecord::Base

  validates :natural_score, presence: true
  validates :strokes_given, presence: true
  validates :points_awarded, presence: true
  validates :played, presence: true

  belongs_to :hole
  belongs_to :tournament_player_round

end
