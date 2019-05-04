class Course < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      course_hash = row.to_hash

      Course.create!(course_hash)
    end
  end

  def self.search(term)
    if term
      where('lower(name) LIKE ?', "%#{term.downcase}%").or(where('lower(code) LIKE ?', "%#{term.downcase}%"))
    else
      all
    end
  end
end
