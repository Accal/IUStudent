class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :faculty, :major, :semester])
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
end
