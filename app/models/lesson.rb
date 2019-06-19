class Lesson < ApplicationRecord
  belongs_to :student
  belongs_to :teacher

  def self.all_teachers
    self.all.map {|lesson| lesson.teacher}
  end

  def self.most_popular_teacher
    arr = all_teachers
    most_popular = arr.uniq.max_by {|i| arr.count(i)}
  end

  def self.all_students
    self.all.map {|lesson| lesson.student}
  end

  def self.student_with_most_lessons
    arr = all_students
    most_popular = arr.uniq.max_by {|i| arr.count(i)}
  end


end
