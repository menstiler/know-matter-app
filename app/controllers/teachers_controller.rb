class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :teacher_authorized, only: [:edit, :destroy]

  def index
    @teachers = Teacher.all
  end

  def show
    @reviews = @teacher.reviews
    session[:original_uri] = request.url
    if session[:user_type] == "student"
      @student = Student.find(session[:user_id])
      @lesson = Lesson.new(teacher_id: @teacher.id, student_id: @student.id)
    end
    @timeslots = @teacher.my_available_timeslots
  end

  def new
    @teacher = Teacher.new
  end

  def create_profile
    @hobby = Hobby.create(hobby_params)
    @teacher = Teacher.new
    render :new
  end

  def existing_hobby_create_profile
    @hobby = Hobby.find(params[:id])
    @teacher = Teacher.new
    render :new
  end

  def create
    @teacher = Teacher.create(teacher_params)
    session[:user_id] = @teacher.id
    session[:user_type] = "teacher"
    redirect_to teacher_welcome_path
  end

  def edit
    @hobbies = Hobby.all
  end

  def update
    @teacher.update(teacher_params)
    redirect_to @teacher
  end

  def destroy
    @teacher.destroy
    session[:user_id] = nil
    session[:user_path] = nil
    redirect_to teacher_login_path
  end

  def select_hobby
    input = params[:search]
    if input
      @hobbies = Hobby.all.select do |hobby|
        hobby.name.downcase.include?(input.downcase) || hobby.subclass.downcase.include?(input.downcase)
      end
    else
      @hobbies = Hobby.all
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:username, :name, :bio, :title, :profile_image, :rates, :location, :hobby_id)
  end

  def hobby_params
    params.require(:hobby).permit(:category, :name, :subclass, :image_url)
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
end
