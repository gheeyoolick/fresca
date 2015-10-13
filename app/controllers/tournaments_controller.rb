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
  	@tournament = Tournament.find(params[:id])
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
	  @tournament = Tournament.find(params[:id])

    #not sure if this will work
    if !@tournament.started? and @tournament.update(tournament_params)
	    redirect_to @tournament
	  else
	    render 'edit'
	  end
	end

	def destroy
  	@tournament = Tournament.find(params[:id])
  	@tournament.destroy

  	redirect_to tournaments_path
	end

	private
		def tournament_params
			params.require(:tournament).permit(:title, :subtitle, :tournament_date, :location, :tournament_type_id, :handicap)
		end
end
