class HobbiesController < ApplicationController
  before_action :authorized

  def index
    @music_hobbies = Hobby.select_categories("Music")
    @art_hobbies = Hobby.select_categories("Art")
    @language_hobbies = Hobby.select_categories("Language")
    @tech_hobbies = Hobby.select_categories("Technology")
  end

  def show
    @hobby = Hobby.find(params[:id])
    category = @hobby.category
    @teachers = Teacher.find_teacher_by_category(category)
  end


end
