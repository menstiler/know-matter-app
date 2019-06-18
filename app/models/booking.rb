class Booking < ApplicationRecord
  belongs_to :teacher
  belongs_to :timeslot
  validates :timeslot_id, uniqueness: { scope: :teacher_id }
end
