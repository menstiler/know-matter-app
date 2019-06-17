class Hobby < ApplicationRecord
  has_many :teachers

  def self.select_categories(category)
    self.all.select do |hobby|
      hobby.category.downcase == category.downcase
    end
  end

  def self.random_selection
    self.all.sample(3)
  end

end
