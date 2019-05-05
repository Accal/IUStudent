class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  def pundit_user
    if !current_admin.nil?
      current_admin
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
