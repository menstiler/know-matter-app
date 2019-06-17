class Timeslot < ApplicationRecord
  has_many :bookings
  has_many :teachers, through: :bookings

end
