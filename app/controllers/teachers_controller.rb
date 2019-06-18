class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :teacher_authorized, only: [:edit, :destroy]

  def index
    @teachers = Teacher.all
  end

  def show
    @reviews = @teacher.reviews
    session[:original_uri] = request.url
    @student = Student.find(session[:user_id])
    @lesson = Lesson.new(teacher_id: @teacher.id, student_id: @student.id)
    @timeslots = @teacher.my_time_slots
  end

  def new
    @teacher = Teacher.new
    @hobbies = Hobby.all
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

  private

  def teacher_params
    params.require(:teacher).permit(:name, :bio, :title, :profile_image, :rates, :location, :hobby_id)
  end


  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
end
