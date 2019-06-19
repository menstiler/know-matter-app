class Teacher < ApplicationRecord
  belongs_to :hobby
  has_many :reviews
  has_many :lessons, dependent: :destroy
  has_many :students, through: :lessons
  has_many :bookings
  has_many :timeslots, through: :bookings
  has_one_attached :profile_image

  validates :name, presence: true
  validates :username, presence: true
  validates :username, uniqueness: true



  def self.find_by_hobby_name(name)
    self.all.select do |teacher|
      teacher.hobby.name.downcase == name.downcase
    end
  end

  def self.find_by_category(category)
    self.all.select do |teacher|
      teacher.hobby.category.downcase == category.downcase
    end
  end

  #shows all my timeslots
  def my_time_slots
    self.bookings.map do |booking|
      booking.timeslot.timeslot
    end
  end

  def my_lesson_timeslots
    self.lessons.map do |lesson|
      lesson.time
    end
  end

  #shows only my available timeslots that have not been taken by student
  def my_available_timeslots
    self.my_time_slots.select do |timeslot|
      !self.my_lesson_timeslots.include?(timeslot)
    end
  end

  def my_students
    students = self.students.map do |student|
      student.name
    end
  end

  def most_popular_student
    arr = self.my_students
    most_popular = arr.uniq.max_by {|i| arr.count(i)}
  end

  def avg_rating
    ratings = self.reviews.map {|review| review.rating}
    ratings.inject(0.0) { |sum, el| sum + el } / ratings.size
  end

end
