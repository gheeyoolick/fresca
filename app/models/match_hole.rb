class MatchHole < ActiveRecord::Base
    
    validates :team_1_natural_score, presence: true
    validates :team_1_strokes_given, presence: true
    validates :team_2_natural_score, presence: true
    validates :team_2_strokes_given, presence: true
    validates :team_1_points_awarded, presence: true
    validates :team_2_points_awarded, presence: true
    validates :played, presence: true
  
    belongs_to :match
    belongs_to :hole

end
