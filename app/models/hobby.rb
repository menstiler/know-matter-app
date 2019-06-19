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

  def self.most_popular_hobby
    arr = self.all
    most_popular = arr.uniq.max_by {|i| arr.count(i)}
  end

  def self.sort_by_new_hobbies
    self.all.sort_by {|hobby| hobby.created_at}.reverse
  end

end
