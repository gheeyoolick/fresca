class Player < ActiveRecord::Base

	validates :first_name, presence: true
  validates :last_name, presence: true
  validates :handicap, presence: true
  validates :email, presence: true

  has_many :tournament_players, :dependent => :destroy
  has_many :tournaments, :through => :tournament_players

  def name_combo
    combo = self.last_name + ", " + self.first_name
    if self.nickname != nil && self.nickname.length>0
      combo = combo + " \"" + self.nickname + "\""
    end
    combo
  end

end