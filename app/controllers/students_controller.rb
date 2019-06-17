class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :lessons]
  # before_action :authorized

  def index
    @students = Student.all
  end

  def show
    @reviews = @student.reviews
    @lessons = @student.lessons
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    redirect_to @student
  end

  def edit

  end

  def update
    @student.update(student_params)
    redirect_to @student
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end

  def lessons
    @lessons = @student.lessons
  end


  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :age, :email, :profile_image)
  end
end
