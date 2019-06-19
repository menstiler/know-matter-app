class Hobby < ApplicationRecord
  has_many :teachers
  has_one_attached :image_url


  def self.select_categories(category)
    self.all.select do |hobby|
      hobby.category.downcase == category.downcase
    end
  end

  def self.random_selection
    self.all.sample(3)
  end

  def default_image
    # byebug
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
