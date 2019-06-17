class TeachersController < ApplicationController
  before_action :authorized

  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
    @reviews = @teacher.reviews
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
end
