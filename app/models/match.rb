class Match < ActiveRecord::Base

  belongs_to :round

  validates :team_1_total_points_awarded, presence: true
  validates :team_2_total_points_awarded, presence: true
  validates :played_through_hole, presence: true
  validates :started, presence: true
  
  has_many :match_players, :dependent => :destroy
  has_many :team_players, :through => :match_players

  has_many :match_holes, :dependent => :destroy
  has_many :holes, :through => :match_holes

end
