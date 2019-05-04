class StudentsController < ApplicationController
  def add_course
    @student = current_student
    @student.add_course(params[:course_code])
    redirect_to root_url, notice: "Course Added."
  end

  def student_params
    params.require(:student).permit(:course_code)
  end
end
