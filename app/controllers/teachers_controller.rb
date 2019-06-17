class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show]
  before_action :authorized

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
    redirect_to teacher_path(@teacher)
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name, :bio, :title, :profile_image, :rates, :location, :hobby_id)
  end


  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
end
