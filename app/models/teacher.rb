class Teacher < ApplicationRecord
  belongs_to :hobby
  has_many :reviews
  has_many :lessons
  has_many :students, through: :lessons

end
