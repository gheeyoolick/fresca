class Match < ActiveRecord::Base

  belongs_to :round

  validates :team_1_total_points_awarded, presence: true
  validates :team_2_total_points_awarded, presence: true
  validates :played_through_hole, presence: true
  validates :started, presence: true
  validates :complete, presence: true

  has_many :match_players, :dependent => :destroy
  has_many :team_players, :through => :match_players

  has_many :match_holes, :dependent => :destroy
  has_many :holes, :through => :match_holes

  def self.award_points_when_round_complete (match_id)    
=begin
    puts "Match.award_points_when_round_complete :: starting"
    #get match
    match = Match.find(match_id)
    # check completeness
    if match.complete?
      #check if there are holes
      if match.match_holes is not nil
        #create variables to hold totals
        team_1_total = 0
        team_2_total = 0
        #increment
        match.match_holes.map.each do |match_hole|
          team_1_total = team_1_total + match_hole.team_1_points_awarded
          team_2_total = team_2_total + match_hole.team_2_points_awarded
        end
        #inptu totals into instance
        match.team_1_total_points_awarded = team_1_total
        match.team_2_total_points_awarded = team_2_total
        #save record
        match.save
      else
        raise "match_holes is nil"
      end
    else
      raise "Cannot award points; the round is not completed"
    end
=end
  end
end
