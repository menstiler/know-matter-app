class Student < ApplicationRecord
  has_many :reviews
  has_many :lessons, dependent: :delete_all
  has_many :teachers, through: :lessons

end
