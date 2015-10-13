class TeeBoxesController < ApplicationController

  def index
    course = Course.find(params[:course_id])
    @tee_boxes = course.tee_boxes
  end

  def show
    course = Course.find(params[:course_id])
    @tee_box = course.tee_box.find(params[:id])
  end


  def new
    course = Course.find(params[:course_id])
    @tee_box = course.tee_boxes.build
    hn = 0
    18.times {
      hn+=1
      @tee_box.holes.build(:hole_number=>hn)
    }
  end

  def create
    course = Course.find(params[:course_id])
    @tee_box = course.tee_boxes.create(tee_box_params)

    @tee_box.total_yardage_dirty = @tee_box.total_yardage
    if @tee_box.save
      redirect_to course
  	else
  		render 'new'
  	end
  end

  def edit
    course = Course.find(params[:course_id])
    @tee_box = course.tee_boxes.find(params[:id])
  end

  def update
    course = Course.find(params[:course_id])
    @tee_box = course.tee_boxes.find(params[:id])

    if @tee_box.update(tee_box_params)
	    redirect_to course
	  else
	    render 'edit'
	  end
	end

  def destroy
    course = Course.find(params[:course_id])
    @tee_box = course.tee_boxes.find(params[:id])
    if @tee_box.destroy
      redirect_to course
    else
      redirect_to course
    end
  end

  private
  def tee_box_params
    params.require(:tee_box).permit(:course_id, :color, :tee_box_type_id, :mens_course_rating, :mens_course_slope, :ladies_course_rating, :ladies_course_slope, holes_attributes: [ :id, :hole_number, :yardage, :par_mens, :handicap_mens, :par_ladies, :handicap_ladies ])
    end
end
