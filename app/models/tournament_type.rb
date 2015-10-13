class TournamentType < ActiveRecord::Base

  include FrescaModules::ClassLevelInheritableAttributes

  inheritable_attributes :individual, :teamscramble, :twoteam
  @individual='INDIVIDUAL'
  @teamscramble='TEAM SCRAMBLE'
  #@team='TEAM'
  @twoteam='TWO-TEAM'

  validates :tournament_type, presence: true

  has_many :tournaments

end
