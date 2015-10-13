class TeamPlayer < ActiveRecord::Base

  belongs_to :team

  has_many :match_players, :dependent => :destroy
  has_many :matches, :through => :meatch_players

end
