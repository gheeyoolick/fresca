class Tournament < ActiveRecord::Base

  validates :title, presence: true
  validates :tournament_date, presence: true
	validates :location, presence: true

  belongs_to :tournament_type

  has_many :rounds, :dependent => :destroy
  
  has_many :tournament_players, :dependent => :destroy
  has_many :players, :through => :tournament_players
  accepts_nested_attributes_for :tournament_players
  validates_associated :tournament_players

  has_many :teams, :dependent => :destroy

end