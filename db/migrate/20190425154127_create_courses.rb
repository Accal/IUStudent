class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :code
      t.string :name
      t.string :instructor
      t.time :period1
      t.time :period2
      t.string :venue

      t.timestamps
    end
  end
end
