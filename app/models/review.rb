class Review < ApplicationRecord
  belongs_to :teacher
  belongs_to :student

  validates :content, presence: true
  validates :rating, presence: true
end
