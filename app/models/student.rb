class Student < ApplicationRecord
  has_many :reviews
  has_many :lessons, dependent: :delete_all
  has_many :teachers, through: :lessons
  has_one_attached :profile_image
  has_secure_password

  validates :name, presence: true
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/

  # returns all of a student's hobbies (signed up for)
  def my_hobbies
    hobbies = self.teachers.map do |teacher|
      teacher.hobby.name
    end
  end

  # hobby that the student is signed up for the most
  def most_popular_hobby
    arr = self.my_hobbies
    most_popular = arr.uniq.max_by {|i| arr.count(i)}
  end

  # returns "keywords" of all the lessons the student is signed up to
  def student_lesson_types
    subclasses = self.lessons.map {|lesson| lesson.teacher.hobby.subclass}
    categories = self.lessons.map {|lesson| lesson.teacher.hobby.category}
    hobbies = self.lessons.map {|lesson| lesson.teacher.hobby.name}
    all_lessons_type = [subclasses, categories, hobbies].flatten
  end

  # returns all matching hobbies based on lessons the student is signed up to
  def student_recommendation
    Hobby.all.select do |hobby|
      student_lesson_types.include?(hobby.name) ||
      student_lesson_types.include?(hobby.category) ||
      student_lesson_types.include?(hobby.subclass)
    end
  end

  def randomize_recommendation
    self.student_recommendation.sample(3)
  end

  # returns student with most lessons
  def self.most_lessons
    self.all.max_by {|student| student.lessons.count}
  end

  def my_timeslots
    if !self.lessons.empty?
      self.lessons.map do |lesson|
        if lesson.request == true
          lesson.time
        end
      end
    end
  end

end
