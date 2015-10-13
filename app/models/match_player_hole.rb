class MatchPlayerHole < ActiveRecord::Base

  belongs_to :match_player
  belongs_to :hole

end
