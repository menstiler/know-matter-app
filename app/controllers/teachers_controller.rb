class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :new_review]
  before_action :authorized

  def index
    @teachers = Teacher.all
  end

  def show
    @reviews = @teacher.reviews
  end

  def new_review
    @student = Student.find(session[:user_id])
    @review = Review.new(teacher_id: @teacher.id, student_id: @student.id)
  end

  def create_review
    @review = Review.create(review_params)
    redirect_to teacher_path(@review.teacher.id)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :teacher_id, :student_id)
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
end
