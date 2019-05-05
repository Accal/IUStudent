class CoursesController < ApplicationController
  def index
    @courses = Course.search(params[:search])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

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
  end

  def update
    @course = Course.find(params[:id])

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
  end

  def destroy
    @course = Course.find(params[:id])

    @course.destroy
    respond_to do |format|
      format.html {redirect_to courses_url, notice: "Course was removed."}
    end
  end

  def import
    Course.import(params[:file])
    redirect_to root_url, notice: "Courses imported."
  end

  private

  def course_params
    params.require(:course).permit(:id, :code, :name, :instructor, :period1, :period2, :venue, :search)
  end
end
