class Student < ApplicationRecord
  has_many :reviews
  has_many :lessons, dependent: :delete_all
  has_many :teachers, through: :lessons
  has_one_attached :profile_image

  validates :name, presence: true
  validates :username, presence: true
  validates :username, uniqueness: true
  # validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/

  def my_hobbies
    hobbies = self.teachers.map do |teacher|
      teacher.hobby.name
    end
  end

  def most_popular_hobby
    arr = self.my_hobbies
    most_popular = arr.uniq.max_by {|i| arr.count(i)}
  end

  def student_lesson_types
    subclasses = self.lessons.map {|lesson| lesson.teacher.hobby.subclass}
    categories = self.lessons.map {|lesson| lesson.teacher.hobby.category}
    hobbies = self.lessons.map {|lesson| lesson.teacher.hobby.name}
    all_lessons_type = [subclasses, categories, hobbies].flatten
  end

  def student_recommendation
    Hobby.all.select do |hobby|
      student_lesson_types.include?(hobby.name) ||
      student_lesson_types.include?(hobby.category) ||
      student_lesson_types.include?(hobby.subclass)
    end
  end

end
