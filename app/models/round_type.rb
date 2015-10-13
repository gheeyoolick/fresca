class RoundType < ActiveRecord::Base
  include FrescaModules::ClassLevelInheritableAttributes

  inheritable_attributes :twoball, :fourball, :headtohead
  @twoball='2-BALL'
  @fourball='4-BALL'
  @headtohead='HEAD-TO-HEAD'

  validates :round_type, presence: true

  has_many :rounds
end
