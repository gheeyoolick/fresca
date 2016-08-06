class Round < ActiveRecord::Base

  validates :round_date, presence: true

  belongs_to :tournament
  belongs_to :round_type
  belongs_to :tee_box

  has_many :tournament_player_rounds, :dependent => :destroy
  has_many :tournament_players, :through => :tournament_player_rounds
  has_many :matches, :dependent => :destroy

  def self.get_next_round_number (tournament_id)
    puts "Round.get_next_round_number :: starting"

    puts "Round.get_next_round_number :: retrieving highest numbered round"
    round = Round.where("tournament_id = ?", tournament_id).order("round_number DESC").take


    if round==nil
      puts "Round.get_next_round_number :: no rounds in tournament, returning 1"
      1
    else
      puts "Round.get_next_round_number :: Max Round Number is" + round.round_number.to_s + ", returning " + (round.round_number+1).to_s
      round.round_number + 1
    end
  end

  def self.reassign_tournament_round_numbers (tournament_id)
    puts "Round.reassign_tournament_round_numbers :: starting"
    #need to implement 
  end

end