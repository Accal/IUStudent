class StudentsController < ApplicationController
  def add_course
    @student = current_student
    @student.add_course(params[:course_code])
    redirect_to root_url, notice: "Course Added."
  end

  def remove_course
    @student = current_student
    @student.remove_course(params[:course_code])
    redirect_to student_url, notice: "Course Removed."
  end

  def show
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:id, :course_code)
  end
end
