class Hobby < ApplicationRecord
  has_many :teachers

  def self.select_categories(name)
    self.all.select do |hobby|
      hobby.name.downcase == name.downcase
    end
  end
end
