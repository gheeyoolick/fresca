class TournamentType < ActiveRecord::Base

  include FrescaModules::ClassLevelInheritableAttributes

  inheritable_attributes :individual, :scramble, :bestball, :twoteam
  @individual='INDIVIDUAL'
  @scramble='SCRAMBLE'
  @bestball='BEST BALL'
  @twoteam='TWO-TEAM WITH MATCH(ES)'

  validates :tournament_type, presence: true

  has_many :tournaments

end
