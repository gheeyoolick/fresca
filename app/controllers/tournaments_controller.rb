class TournamentsController < ApplicationController

  def index
		@tournaments = Tournament.all.order(tournament_date: :desc)
	end

	def show
    @tournament = Tournament.find(params[:id])
  end

	def new
		@tournament = Tournament.new
	end

	def edit
  	puts "TournamentController.edit :: starting"
    @tournament = Tournament.find(params[:id])
    puts "TournamentController.edit :: complete"
	end

	def create
    @tournament = Tournament.new(tournament_params)

    if @tournament.tournament_type.tournament_type==TournamentType.twoteam
      @tournament.teams.build(:name=>"Unnamed", :team_number=>1)
      @tournament.teams.build(:name=>"Unnamed", :team_number=>2)
    end

 		if @tournament.save
  		redirect_to @tournament
  	else
  		render 'new'
  	end
	end

	def update
	  puts "TournamentController.update :: starting :: id="+params[:id]
    @tournament = Tournament.find(params[:id])

    #if tourney hasn't started and the update works
    if !@tournament.started? and @tournament.update(tournament_params)
	    puts "TournamentController.update :: started is false and update succeeded"
      redirect_to @tournament
	  else
	    render 'edit'
	  end
	end

  def add_tournament_players
    @tournament = Tournament.find(params[:id])
  end

  def save_tournament_players
    @tournament = Tournament.find(params[:id])

    #if tourney hasn't started and the update works
    if !@tournament.started? and @tournament.update(tournament_params)
      @tournament.tournament_players.each do |player|
        player.tournament_handicap = player.player.handicap
        player.save
      end
      redirect_to @tournament
	  else
      render 'add_tournament_players'
	  end
  end

  def select_course_for_tournament_round
    puts "TournamentController.select_course_for_tournament_round :: starting"
    #getting tournament with id
    @tournament = Tournament.find(params[:tournament_id])
    @round = @tournament.rounds.new
    puts "TournamentController.select_course_for_tournament_round :: params="+params.to_s
  end

  def add_tournament_round
    puts "TournamentsController.add_tournament_round :: starting"
    #getting tournament by id
    @tournament = Tournament.find(params[:id])
    @course = Course.find(params[:course_id])

  end

  def save_tournament_round
    puts "TournamentsController.save_tournament_round :: starting"

    #getting tournament by id
    @tournament = Tournament.find(params[:id])

    #if tourney hasn't started and the update works
    if !@tournament.started? and @tournament.update(tournament_params)
      redirect_to @tournament
	  else
      render 'add_tournament_round'
	  end
  end


  def destroy
  	@tournament = Tournament.find(params[:id])
  	@tournament.destroy

  	redirect_to tournaments_path
	end

	private
		def tournament_params
			params.require(:tournament).permit(:title, :subtitle, :tournament_date, :location, :tournament_type_id, :handicap, player_ids: [])
		end
end
