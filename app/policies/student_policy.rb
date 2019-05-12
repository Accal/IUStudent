class StudentPolicy < ApplicationPolicy
  attr_reader :user, :student

  def initialize(user, student)
    @user = user
    @student = student
  end

  def show?
    user.is_a?(Admin) or owned_by_current_user?
  end

  def calendar?
    user.is_a?(Admin) or owned_by_current_user?
  end

  def add_course?
    user.is_a?(Admin) or owned_by_current_user?
  end

  def remove_course?
    user.is_a?(Admin) or owned_by_current_user?
  end

  private 

  def owned_by_current_user?
    if @user.id == @student.id
      true
    else
      false
    end
  end
  
end