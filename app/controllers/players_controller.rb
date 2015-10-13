class PlayersController < ApplicationController

	def index
		@players = Player.all.order(:last_name, :first_name)
	end
	
	def show
    @player = Player.find(params[:id])
  end
	
	def new
		@player = Player.new
	end
	
	def edit
  	@player = Player.find(params[:id])
	end
	
	def create
		@player = Player.new(player_params)
 
 		if @player.save
  		redirect_to @player
  	else
  		render 'new'
  	end
	end
	
	def update
	  @player = Player.find(params[:id])
	 
	  if @player.update(player_params)
	    redirect_to @player
	  else
	    render 'edit'
	  end
	end
	
	def destroy
  	@player = Player.find(params[:id])
  	@player.destroy
 
  	redirect_to players_path
	end
	
	private 
		def player_params
			#need to strengthen the params requirements to prevent poor/broken data input
			params.require(:player).permit(:first_name, :last_name, :nickname, :handicap, :notes, :username, :password, :email)
			
		end
end
