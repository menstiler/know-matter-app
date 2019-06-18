class Teacher < ApplicationRecord
  belongs_to :hobby
  has_many :reviews
  has_many :lessons, dependent: :destroy
  has_many :students, through: :lessons
  has_many :bookings
  has_many :timeslots, through: :bookings



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

end
