class CoursesController < ApplicationController

	def index
		@courses = Course.all.order('number_of_holes DESC', :name)
	end

	def show
    @course = Course.find(params[:id])
  end

	def new
		@course = Course.new
	end

	def edit
  	@course = Course.find(params[:id])
	end

	def create
		@course = Course.new(course_params)

 		if @course.save
  		redirect_to @course
  	else
  		render 'new'
  	end
	end

	def update
	  @course = Course.find(params[:id])

	  if @course.update(course_params)
	    redirect_to @course
	  else
	    render 'edit'
	  end
	end

	def destroy
  	@course = Course.find(params[:id])
  	@course.destroy

  	redirect_to courses_path
	end

	private
		def course_params
			#need to strengthen the params requirements to prevent poor/broken data input
      params.require(:course).permit(:name, :phone_number, :address, :city, :state, :zip, :par3, :number_of_holes)
		end
end