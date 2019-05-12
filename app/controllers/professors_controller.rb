class ProfessorsController < ApplicationController
  def index
    @professors = Professor.all
  end

  def show
    if params[:id]
      @professor = Professor.find(params[:id])
    else
      @professor = current_professor
    end
  end

  def add_course
    @professor = current_professor
    @professor.add_course(params[:course_code])
    redirect_to root_url, notice: "Course Added."
    authorize @professor
  end

  def remove_course
    @professor = current_professor
    @professor.remove_course(params[:course_code])
    redirect_to professor_profile_url, notice: "Course Removed."
    authorize @professor
  end

  def calendar
    if params[:id]
      @professor = Professor.find(params[:id])
    else
      @professor = current_professor
    end

    @formatted_courses = Array.new
    @professor.courses.each do |course|
      array_of_times = Array.new
      array_of_times.push(course.name)
      array_of_times.push(course.day1)
      array_of_times.push(course.time1_start)
      array_of_times.push(course.time1_end)

      array_of_times.push(course.day2)
      array_of_times.push(course.time2_start)
      array_of_times.push(course.time2_end)
      @formatted_courses.push(array_of_times)
    end
  end

  private

  def professor_params
    params.require(:professor).permit(:id, :course_code)
  end
end
