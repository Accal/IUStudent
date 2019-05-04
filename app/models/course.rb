class Course < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      course_hash = row.to_hash

      Course.create!(course_hash)
    end 
  end
end
