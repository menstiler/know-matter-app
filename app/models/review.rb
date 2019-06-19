class Review < ApplicationRecord
  belongs_to :teacher
  belongs_to :student

  validates :content, presence: true
  validates :rating, presence: true

  # returns teachers who have reviews
  def self.teachers_with_reviews
    self.all.map {|review| review.teacher}
  end

  # returns teacher with most reviews
  def self.teacher_with_most_reviews
    arr = teachers_with_reviews
    most_popular = arr.uniq.max_by {|i| arr.count(i)}
  end

  # returns students who have reviews
  def self.students_with_reviews
    self.all.map {|review| review.student}
  end

  # returns students with most reviews
  def self.student_with_most_reviews
    arr = students_with_reviews
    most_popular = arr.uniq.max_by {|i| arr.count(i)}
  end

  

end
