class Student < ApplicationRecord
  has_many :reviews
  has_many :lessons, dependent: :destroy
  has_many :teachers, through: :lessons

end
