class Student < ApplicationRecord
  has_many :reviews
  has_many :lessons
  has_many :teachers, through: :lessons

end
