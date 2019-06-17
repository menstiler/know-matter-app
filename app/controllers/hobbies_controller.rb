class HobbiesController < ApplicationController
  before_action :authorized

  def index
    @creative_hobbies = Hobby.select_categories("Creative")
    @tech_hobbies = Hobby.select_categories("Tech")
    @lifestyle_hobbies = Hobby.select_categories("Language")
  end

  def show
    @hobby = Hobby.find(params[:id])
    name = @hobby.name
    @teachers = Teacher.find_by_hobby_name(name)
  end

  def show_by_category
    input = params[:search]
    @category = params[:name]
    if input
      @hobbies = Hobby.all.select do |hobby|
        hobby.name.downcase.include?(input.downcase) || hobby.subclass.downcase.include?(input.downcase)
      end
    else
      @hobbies = Hobby.select_categories(@category)
    end
  end

  def new
  end

  def create
  end


end
