class CoursesController < ApplicationController

  def index
    @courses = Course.search(params[:search])
  end

  def new
    @course = Course.new
    authorize @course
  end

  def create
    @course = Course.new(course_params)
    authorize @course

    respond_to do |format|
      if @course.save
        format.html {redirect_to courses_path, notice: 'Your course has been created.'}
      else
        format.html {render :new}
      end
    end
  end

  def edit
    @course = Course.find(params[:id])
    authorize @course
  end

  def update
    @course = Course.find(params[:id])
    authorize @course

    respond_to do |format|
      if @course.update(course_params)
        format.html {redirect_to courses_path, notice: 'Your course has been updated.'}
      else
        format.html {render :edit}
      end
    end
  end

  def show
    @course = Course.find(params[:id])
    @page_title = @course.name

    @formatted_course = Array.new
    @formatted_course.push(@course.name)
    @formatted_course.push(@course.day1)
    @formatted_course.push(@course.time1_start)
    @formatted_course.push(@course.time1_end)

    @formatted_course.push(@course.day2)
    @formatted_course.push(@course.time2_start)
    @formatted_course.push(@course.time2_end)
  end

  def destroy
    @course = Course.find(params[:id])
    authorize @course

    @course.destroy
    respond_to do |format|
      format.html {redirect_to courses_url, notice: "Course was removed."}
    end
  end

  def import
    authorize Course
    Course.import(params[:file])
    redirect_to root_url, notice: "Courses imported."
  end

  private

  def course_params
    params.require(:course).permit(:id, :code, :name, :instructor, :period1, :period2, :venue, :search)
  end
end
