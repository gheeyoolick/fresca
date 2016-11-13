class RoundType < ActiveRecord::Base
  include FrescaModules::ClassLevelInheritableAttributes

  inheritable_attributes :individual, :scramble, :bestball, :headtohead
  @individual='INDIVIDUAL'
  @scramble='SCRAMBLE'
  @bestball='BEST BALL'
  @matchscramble='MATCH: SCRAMBLE'
  @matchbestball='MATCH: BEST BALL'
  @matchheadtohead='MATCH: HEAD-TO-HEAD'

  validates :round_type, presence: true

  has_many :rounds

end
