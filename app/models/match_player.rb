class MatchPlayer < ActiveRecord::Base
  
  validates :strokes_given, presence: true
  
  belongs_to :match
  belongs_to :team_player

  has_many :match_player_holes, :dependent => :destroy
  has_many :holes, :through => :match_player_holes

end
