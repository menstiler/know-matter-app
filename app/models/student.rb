class Student < ApplicationRecord
  has_many :reviews
  has_many :lessons, dependent: :delete_all
  has_many :teachers, through: :lessons
  has_one_attached :profile_image

  def my_hobbies
    hobbies = self.teachers.map do |teacher|
      teacher.hobby.name
    end
  end

  def most_popular_hobby
    arr = self.my_hobbies
    most_popular = arr.uniq.max_by {|i| arr.count(i)}
  end

end
