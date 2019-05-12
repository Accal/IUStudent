class CreateCoursesProfessorsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :courses_professors, id: false do |t|
      t.belongs_to :professor, index: true
      t.belongs_to :course, index:true
    end
  end
end
