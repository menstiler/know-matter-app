class HobbiesController < ApplicationController
  before_action :authorized, except: [:new]

  def index
    input = params[:search]
    if input
      @hobbies= Hobby.all.select do |hobby|
        hobby.name.downcase.include?(input.downcase) || hobby.subclass.downcase.include?(input.downcase)
      end
    else
      @hobbies = Hobby.all
    end
    @hobby_names = Hobby.names
  end

  def show
    input = params[:search]
    if input
      @hobby = Hobby.all.find do |hobby|
        params[:subclass].downcase.include?(hobby.subclass.downcase)
      end
      @teachers = Teacher.where(name: input)
    else
      @hobby = Hobby.find(params[:id])
      subclass = @hobby.subclass
      @teachers = Teacher.find_by_subclass(subclass)
    end
  end

  def show_by_category
    input = params[:search]
    @category = params[:name]
    if input
      hobbies = Hobby.select_categories(@category)
      @hobbies = hobbies.select do |hobby|
        hobby.name.downcase.include?(input.downcase) || hobby.subclass.downcase.include?(input.downcase)
      end
    else
      @hobbies = Hobby.select_categories(@category)
    end
    @hobby_names = Hobby.names_by_category(@category)
  end

  def new
    @hobby = Hobby.new
  end

  def sort_by_popularity
    @hobbies = Hobby.sort_by_popularity
    @hobby_names = Hobby.names
    render :index
  end

  def category_sort_by_popularity
    @category = params[:name]
    @hobbies = Hobby.category_sort_by_popularity(@category)
    @hobby_names = Hobby.names
    @hobby_names = Hobby.names_by_category(@category)
    render :show_by_category
  end

  def teachers_sort_rating
    subclass = params[:subclass]
    teachers = Teacher.find_by_subclass(subclass)
    @hobby = Hobby.find_by(subclass: subclass)
    @teachers = teachers.sort_by do |teacher|
      - teacher.avg_rating
    end
    render :show
  end

  def teachers_sort_rates
    subclass = params[:subclass]
    teachers = Teacher.find_by_subclass(subclass)
    @hobby = Hobby.find_by(subclass: subclass)
    @teachers = teachers.sort_by do |teacher|
      teacher.rates
    end
    render :show
  end

end
