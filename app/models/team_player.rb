class TeamPlayer < ActiveRecord::Base

  belongs_to :team
  belongs_to :tournament_player

  has_many :match_players, :dependent => :destroy
  has_many :matches, :through => :match_players

  has_one :player, :through => :tournament_player
  default_scope {joins(:player).order('players.last_name ASC, players.first_name ASC')}

end
