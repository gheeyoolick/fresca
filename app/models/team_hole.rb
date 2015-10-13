class TeamHole < ActiveRecord::Base

  validates :natural_score, presence: true
  validates :handicap_modifier, presence: true
  validates :played, presence: true

  belongs_to :hole
  belongs_to :team

end
