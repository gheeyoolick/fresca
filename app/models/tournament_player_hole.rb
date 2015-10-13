class TournamentPlayerHole < ActiveRecord::Base

  validates :handicap_modifier, presence: true

  belongs_to :hole
  belongs_to :tournament_player_round

end
