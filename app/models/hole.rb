class Hole < ActiveRecord::Base
  validates :hole_number, presence: true
  validates :hole_number, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 18 }
  validates :par_mens, numericality: { only_integer: true, greater_than_or_equal_to: 3, less_than_or_equal_to: 5 }
  validates :par_ladies, numericality: { only_integer: true, greater_than_or_equal_to: 3, less_than_or_equal_to: 5 }
  validates :handicap_mens, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 18 }
  validates :handicap_ladies, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 18 }

  default_scope { order(:hole_number => :asc)}

  belongs_to :tee_box

  has_many :tournament_player_holes, :dependent => :destroy
  has_many :match_holes, :dependent => :destroy
  has_many :match_player_holes, :dependent => :destroy

end
