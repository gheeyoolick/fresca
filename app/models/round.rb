class Round < ActiveRecord::Base

  validates :round_date, presence: true

  belongs_to :tournament
  belongs_to :round_type
  belongs_to :course

  has_many :tournament_player_rounds, :dependent => :destroy
  has_many :tournament_players, :through => :tournament_player_rounds

  has_many :matches, :dependent => :destroy
  
end