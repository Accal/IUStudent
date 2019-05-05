class StudentsController < ApplicationController
  def add_course
    @student = current_student
    @student.add_course(params[:course_code])
    redirect_to root_url, notice: "Course Added."
    authorize @student
  end

  def remove_course
    @student = current_student
    @student.remove_course(params[:course_code])
    redirect_to profile_url, notice: "Course Removed."
    authorize @student
  end

  def show
    if params[:id]
      @student = Student.find(params[:id])
    else
      @student = current_student
    end
    authorize @student
  end

  private

  def student_params
    params.require(:student).permit(:id, :course_code)
  end
end
