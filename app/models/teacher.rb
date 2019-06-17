class Teacher < ApplicationRecord
  belongs_to :hobby
  has_many :reviews
  has_many :lessons
  has_many :students, through: :lessons
  has_many :bookings
  has_many :timeslots, through: :bookings 



  def self.find_teacher_by_category(category)
    self.all.select do |teacher|
      teacher.hobby.category.downcase == category.downcase
    end
  end


end
