class Match < ActiveRecord::Base

  belongs_to :round

  has_many :match_players, :dependent => :destroy
  has_many :team_players, :through => :match_players

  has_many :match_holes, :dependent => :destroy
  has_many :holes, :through => :match_holes

end
