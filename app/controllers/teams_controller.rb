class TeamsController < ApplicationController

  def index
    tournament = Tournament.find(params[:tournament_id])
    @teams = tournament.teams.order("team_number desc")
  end

  def show
    tournament = Tournament.find(params[:tournament_id])
    @team = tournament.teams.find(params[:id])
  end

  def new
    tournament = Tournament.find(params[:tournament_id])
    @team = tournament.teams.new
  end

  def create
    tournament = Tournament.find(params[:tournament_id])
    @team = tournament.teams.create(team_params)
    @team.team_number = Team.get_next_team_number(tournament.id)
    if @team.save
      redirect_to tournament
  	else
  		render 'new'
  	end
  end

  def edit
    tournament = Tournament.find(params[:tournament_id])
    @team = tournament.teams.find(params[:id])
  end

  def update
    tournament = Tournament.find(params[:tournament_id])
    puts "WOOHOO!"+params.to_s
    @team = tournament.teams.find(params[:id])

    if @team.update(team_params)
      redirect_to tournament
	  else
	    render 'edit'
	  end
	end

  def add_team_players
    tournament = Tournament.find(params[:tournament_id])
    @team = tournament.teams.find(params[:team_id])
  end

  def save_team_players
    tournament = Tournament.find(params[:tournament_id])
    @team = tournament.teams.find(params[:team_id])

    #if tourney hasn't started and the update works
    if !tournament.started? and @team.update(team_params)
      redirect_to @team.tournament
	  else
      render 'add_team_players'
	  end
  end

  def destroy
    tournament = Tournament.find(params[:tournament_id])
    @team = tournament.teams.find(params[:id])
    if @team.destroy
      redirect_to tournament
    else
      redirect_to tournament
    end
  end

  private
  def team_params
    params.require(:team).permit(:name, :team_number, tournament_player_ids: [])
  end
end
