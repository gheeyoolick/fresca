class TournamentPlayersController < ApplicationController

  def index
    tournament = Tournament.find(params[:tournament_id])
    @tournament_players = tournament.tournament_players.order("player.last_name desc")
  end

  def show
    tournament = Tournament.find(params[:tournament_id])
    @tournament_player = tournament.tournament_players.find(params[:id])
  end

  def new
    tournament = Tournament.find(params[:tournament_id])
    @tournament_player = tournament.tournament_players.build
  end

  def create
    tournament = Tournament.find(params[:tournament_id])
    puts "PARAMS ARE: "+tournament_player_params
    puts "tournament_player_params[:tournament_player][:player_id]: "+tournament_player_params[:tournament_player][:player_id]
    tournament_player_params[:tournament_player][:player_id].each do player_id
      puts "Player_id is:" + player_id
      @tournament_player = tournament.tournament_players.create(:player_id => player_id)
      @tournament_player.tournament_handicap = @tournament_player.player.handicap
      if @tournament_player.save
        redirect_to tournament
  	  end
    end
    render 'new'

  end

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
    params.require(:tournament_player).permit(:player_id, player_id: [], :tournament_handicap)
    end
end
