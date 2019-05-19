class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def pundit_user
    if !current_admin.nil?
      current_admin
    elsif !current_professor.nil?
      current_professor
    elsif !current_student.nil?
      current_student
    else
      guest_user
    end
  end

  def guest_user
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@example.com"
    guest
  end

  protected

  def devise_parameter_sanitizer
    if resource_class == Student
      Student::ParameterSanitizer.new(Student, :student, params)
    elsif resource_class == Professor
      Professor::ParameterSanitizer.new(Professor, :professor, params)
    else
      super # Use the default one
    end
  end
end
