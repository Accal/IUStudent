class Professor < ApplicationRecord
  has_and_belongs_to_many :courses

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def add_course(course_code)
    courses << Course.find_by(code: course_code)
  end

  def remove_course(course_code)
    courses.delete(Course.find_by(code: course_code))
  end
end
