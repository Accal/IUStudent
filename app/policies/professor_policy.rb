class ProfessorPolicy < ApplicationPolicy
  attr_reader :user, :professor

  def initialize(user, professor)
    @user = user
    @professor = professor
  end

  def add_course?
    user.is_a?(Admin) or owned_by_current_user?
  end

  def remove_course?
    user.is_a?(Admin) or owned_by_current_user?
  end

  private

  def owned_by_current_user?
    if @user.id == @professor.id
      true
    else
      false
    end
  end
end