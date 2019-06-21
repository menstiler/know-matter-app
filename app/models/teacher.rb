class Teacher < ApplicationRecord
  belongs_to :hobby
  has_many :reviews
  has_many :lessons, dependent: :destroy
  has_many :students, through: :lessons
  has_many :bookings
  has_many :timeslots, through: :bookings
  has_one_attached :profile_image
  has_secure_password

  validates :name, presence: true
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :rates, presence: true
  validates :location, presence: true
  validates :title, presence: true


  # returns teachers based on hobby name passed in as argument
  def self.find_by_hobby_name(name)
    self.all.select do |teacher|
      teacher.hobby.name.downcase == name.downcase
    end
  end

  # returns teachers based on subclass passed in as argument
  def self.find_by_subclass(subclass)
    self.all.select do |teacher|
      teacher.hobby.subclass.downcase == subclass.downcase
    end
  end

  #shows all my timeslots
  def my_time_slots
    self.bookings.map do |booking|
      booking.timeslot.timeslot
    end
  end

  # returns all timeslots for teacher (both booked and available)
  def my_lesson_timeslots
    self.lessons.map do |lesson|
      if lesson.active == true || lesson.request == true
        lesson.time
      end
    end
  end

  #shows only my available timeslots that have not been taken by student
  def my_available_timeslots
    self.my_time_slots.select do |timeslot|
      !self.my_lesson_timeslots.include?(timeslot)
    end
  end

  # reutrns all the students for a teacher
  def my_students
    students = self.students.map do |student|
      student.name
    end
  end

  # returns student that signed up most to teacher's class
  def most_popular_student
    arr = self.my_students
    most_popular = arr.uniq.max_by {|i| arr.count(i)}
  end

  #returns average rating for a teacher
  def avg_rating
    unless self.reviews.empty?
      ratings = self.reviews.map {|review| review.rating}
      ratings.inject(0.0) { |sum, el| sum + el } / ratings.size
    else
      0
    end
  end

  # return number of students signed up to a teacher's class
  def number_students
    self.my_students.length
  end

  #returns teacher with most students signed up to class
  def self.most_popular
    self.all.max_by {|teacher| teacher.number_students}
  end

  #sort teachers based on popularity(most popular at top)
  def self.sort_by_popularity
    self.all.sort_by {|teacher| -teacher.number_students}
  end

  # sorts teachers by average rating
  def self.sort_by_rating
    Review.teachers_with_reviews.uniq.sort_by { |teacher| - teacher.avg_rating }
  end


  # sorts by teacher rates lowest to highest
  def self.sort_by_rates
    self.all.sort_by do |teacher|
      teacher.rates
    end
  end



end
