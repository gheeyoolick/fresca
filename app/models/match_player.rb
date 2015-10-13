class MatchPlayer < ActiveRecord::Base

  belongs_to :match
  belongs_to :team_player

  has_many :match_player_holes, :dependent => :destroy
  has_many :holes, :through => :match_player_holes

end
