class Hobby < ApplicationRecord
  has_many :teachers
  validates :category, presence: true
  validates :name, presence: true
  validates :subclass, presence: true
  validates :subclass, uniqueness: true
  has_one_attached :image_url



  # returns all the hobbies that match the category passed in
  def self.select_categories(category)
    self.all.select do |hobby|
      hobby.category.downcase == category.downcase
    end
  end

  # returns 3 randomly selected hobbies for student welcome page
  def self.random_selection
    self.all.sample(3)
  end

  #returns most popular hobby based on # of students signed up for the hobby
  def self.most_popular_hobby
    self.all.max_by do |hobby|
      hobby.num_students
    end
  end

  #returns sorted list of hobbies by recently added
  def self.sort_by_new_hobbies
    self.all.sort_by {|hobby| hobby.created_at}.reverse
  end

  #returns top three recently added
  def self.three_recent
    self.sort_by_new_hobbies[0..2]
  end


  #count # of students signed up to a hobby
  def num_students
    num_students = 0
    self.teachers.each do |teacher|
      num_students += teacher.students.length
    end
    num_students
  end

  # sorts hobby by popularity based on # of students signed up for the hobby
  def self.sort_by_popularity
    self.all.sort_by do |hobby|
      - hobby.num_students
    end
  end

  # selects top 3 hobbies
  def self.top_three
    self.sort_by_popularity[0..2]
  end

  # sorts hobby by popularity based on # of students signed up for the hobby for a specific hobby category
  def self.category_sort_by_popularity(category)
    self.select_categories(category).sort_by do |hobby|
      hobby.num_students
    end
  end

  # returns all available names for hobby (for filter feature)
  def self.names
    self.all.map do |hobby|
      hobby.name
    end.uniq
  end

  def self.names_by_category(category)
    self.select_categories(category).map do |hobby|
      hobby.name
    end.uniq
  end

  def default_image
    case self.name
      when "Music"
        "https://c.stocksy.com/a/gOf700/z9/1827430.jpg?1560798036"
      when "Art"
        "https://coursehorse.imgix.net/images/course/101/main/paint_along_nyc_56af08c68f0a2.png?auto=format%2Cenhance%2Ccompress&crop=entropy&fit=crop&h=220&ixlib=php-1.2.1&q=90&w=330"
      when "Web Development"
        "https://digitaldefynd.com/wp-content/uploads/2018/01/best-free-web-development-courses-training-tutorials-and-certifications.jpg"
      when "Language"
        "https://learnatcentral.org/wp-content/uploads/2016/01/Page-Header-Language-French-300x200.jpg"
    end
  end

end
