class CoursePolicy < ApplicationPolicy
  attr_reader :user, :course

  def initialize(user, course)
    @user = user
    @post = course
  end

  def new?
    user.is_a?(Admin)
  end

  def create?
    user.is_a?(Admin)
  end

  def edit?
    user.is_a?(Admin)
  end

  def update?
    user.is_a?(Admin)
  end

  def destroy?
    user.is_a?(Admin)
  end

  def import?
    user.is_a?(Admin)
  end
end