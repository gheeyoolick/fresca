class HolesController < ApplicationController

  def new
    @hole = Hole.new
	end


  def create
    @hole = Hole.new(hole_params)
	end

  def destroy
    puts "in hole destroy"
  end
  
  private
  def hole_params
    params.permit(:hole_number, :par, :handicap, :yardage)
    end
end
