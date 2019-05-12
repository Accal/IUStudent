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
    redirect_to student_profile_url, notice: "Course Removed."
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

  def calendar
    if params[:id]
      @student = Student.find(params[:id])
    else
      @student = current_student
    end

    @formatted_courses = Array.new
    @student.courses.each do |course|
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
    authorize @student
  end

  private

  def student_params
    params.require(:student).permit(:id, :course_code)
  end
end
