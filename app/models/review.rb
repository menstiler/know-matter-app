class Review < ApplicationRecord
  belongs_to :teacher
  belongs_to :student

  validates :content, presence: true
  validates :rating, presence: true

  def self.teachers_with_reviews
    self.all.map {|review| review.teacher}
  end

  def self.teacher_with_most_reviews
    arr = teachers_with_reviews
    most_popular = arr.uniq.max_by {|i| arr.count(i)}
  end

  def self.students_with_reviews
    self.all.map {|review| review.student}
  end

  def self.student_with_most_reviews
    arr = students_with_reviews
    most_popular = arr.uniq.max_by {|i| arr.count(i)}
  end

  def self.sort_by_rating
    teachers_with_reviews.sort_by { |teacher| teacher.avg_rating }.reverse
  end
end
