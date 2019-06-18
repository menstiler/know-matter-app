class Timeslot < ApplicationRecord
  has_many :bookings
  has_many :teachers, through: :bookings
  validates :timeslot, uniqueness: true

end
