class RoundsController < ApplicationController

  def show
    puts "RoundsController.new :: starting"
    #finding tournament by id
    @tournament = Tournament.find(params[:tournament_id])
    #finding round by id
    @round = @tournament.rounds.find(params[:id])
  end

  def new
    puts "RoundsController.new :: starting"
    #finding tournament by id
    @tournament = Tournament.find(params[:tournament_id])
    #creating new empty round in tournament for use in form
    @course = Course.find(params[:course_id])
    @round = @tournament.rounds.new
  end

  def create
    puts "RoundsController.create :: starting"
    #finding tournament by id
    tournament = Tournament.find(params[:tournament_id])
    #creating new round in tournament using params from form
    @round = tournament.rounds.create(round_params)
    #getting next round number for the tournament
    @round.round_number = Round.get_next_round_number(tournament.id)

    if @round.save
      #tournament.check_round_numbers
      redirect_to tournament
  	else
  		render 'new'
  	end
  end

  def edit
    puts "RoundsController.edit :: starting"
    @tournament = Tournament.find(params[:tournament_id])
    @round = @tournament.rounds.find(params[:id])
    @changed_course=false
    if (params[:change_course]=="true")
      puts "RoundsController.edit :: changing course"
      @changed_course=true
      @course = Course.find(params[:course_id])
    else
      puts "RoundsController.edit :: no change to course"
      @course = @round.tee_box.course
    end
  end

  def update
    puts "RoundsController.update :: starting"
    tournament = Tournament.find(params[:tournament_id])
    @round = tournament.rounds.find(params[:id])

    if @round.update(round_params)
      redirect_to tournament
	  else
	    render 'edit'
	  end
	end

  def destroy
    puts "RoundsController.destroy :: starting"
    tournament = Tournament.find(params[:tournament_id])
    @round = tournament.rounds.find(params[:id])
    if @round.destroy
      Round.reassign_tournament_round_numbers(tournament.id)
      redirect_to tournament
    else
      redirect_to tournament
    end
  end

  def change_course_for_tournament_round
    puts "RoundController.change_course_for_tournament_round :: starting"
    #getting tournament with id
    @tournament = Tournament.find(params[:tournament_id])
    @round = Round.find(params[:id])
    puts "RoundController.change_course_for_tournament_round :: params="+params.to_s
  end

  private
  def round_params
    puts "RoundsController.round_params :: starting"
    params.require(:round).permit(:round_date, :round_number, :tee_box_id, :round_type_id, :track_player_hole_scores, :started, :complete, :number_of_holes, :par3, match_ids: [])
  end
end