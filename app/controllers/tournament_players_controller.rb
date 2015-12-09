class TournamentPlayersController < ApplicationController

  def edit
    tournament = Tournament.find(params[:tournament_id])
    @tournament_player = tournament.tournament_players.find(params[:id])
  end

  def update
    tournament = Tournament.find(params[:tournament_id])
    @tournament_player = tournament.tournament_players.find(params[:id])

    if @tournament_player.update(tournament_player_params)
      redirect_to tournament
	  else
	    render 'edit'
	  end
	end

  def destroy
    tournament = Tournament.find(params[:tournament_id])
    @tournament_player = tournament.tournament_players.find(params[:id])
    if @tournament_player.destroy
      redirect_to tournament
    else
      redirect_to tournament
    end
  end

  private
  def tournament_player_params
    params.require(:tournament_player).permit(:tournament_handicap)
    end
end
