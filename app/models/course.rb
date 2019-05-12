class Course < ApplicationRecord
  require 'csv'
  has_and_belongs_to_many :students
  has_and_belongs_to_many :professors

  def day1
    unless self.period1.nil?
      self.period1.split.first
    else
      ""
    end
  end

  def time1_start
    unless self.period1.nil?
      time_array = self.period1.split
      time_array[1].split('-').first
    else
      ""
    end
  end

  def time1_end
    unless self.period1.nil?
      time_array = self.period1.split
      time_array[1].split('-').second
    else
      ""
    end
  end

  def day2
    unless self.period2.nil?
      self.period2.split.first
    else
      ""
    end
  end

  def time2_start
    unless self.period2.nil?
      time_array = self.period2.split
      time_array[1].split('-').first
    else
      ""
    end
  end

  def time2_end
    unless self.period2.nil?
      time_array = self.period2.split
      time_array[1].split('-').second
    else
      ""
    end
  end

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
