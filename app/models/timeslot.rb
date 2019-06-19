class Timeslot < ApplicationRecord
  has_many :bookings
  has_many :teachers, through: :bookings
  validates :timeslot, uniqueness: true

  # returns all days (used for dropdown list when creating new booking)
  def self.all_days
    self.all.map do |timeslot|
      timeslot.day
    end.uniq
  end

  # returns all times (used for dropdown list when creating new booking)
  def self.all_times
    self.all.map do |timeslot|
      timeslot.time
    end.uniq
  end
end
