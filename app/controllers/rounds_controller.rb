class RoundsController < ApplicationController

  def index
    tournament = Tournament.find(params[:tournament_id])
    @rounds = tournament.rounds.order("round_date desc, round_number asc")
  end

  def show
    tournament = Tournament.find(params[:tournament_id])
    @round = tournament.rounds.find(params[:id])
  end

  def new
    tournament = Tournament.find(params[:tournament_id])
    @round= tournament.rounds.new
  end

  def create
    tournament = Tournament.find(params[:tournament_id])
    @round = tournament.rounds.create(round_params)
    @round.round_number = Round.get_next_round_number(tournament.id)
    if @round.save
      redirect_to tournament
  	else
  		render 'new'
  	end
  end

  def edit
    tournament = Tournament.find(params[:tournament_id])
    @round = tournament.rounds.find(params[:id])
  end

  def update
    tournament = Tournament.find(params[:tournament_id])
    @round = tournament.rounds.find(params[:id])

    if @round.update(round_params)
      redirect_to tournament
	  else
	    render 'edit'
	  end
	end

  #def add_team_players
    #tournament = Tournament.find(params[:tournament_id])
    #@team = tournament.teams.find(params[:team_id])
  #end

  #def save_team_players
    #tournament = Tournament.find(params[:tournament_id])
    #@team = tournament.teams.find(params[:team_id])

    #if tourney hasn't started and the update works
    #if !tournament.started? and @team.update(team_params)
    #  redirect_to @team.tournament
	  #else
    #  render 'add_team_players'
	  #end
  #end

  def destroy
    tournament = Tournament.find(params[:tournament_id])
    @round = tournament.rounds.find(params[:id])
    if @round.destroy
      Round.reassign_tournament_round_numbers(tournament.id)
      redirect_to tournament
    else
      redirect_to tournament
    end
  end

  private
  def round_params
    params.require(:round).permit(:round_date, :round_number, :track_player_hole_scores, :started, :complete, :number_of_holes, :par3, match_ids: [])
  end
end