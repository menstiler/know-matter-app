class ReviewsController < ApplicationController
  before_action :set_review, only: [:update]
  def new
    @teacher = Teacher.find(params[:id])
    @student = Student.find(session[:user_id])
    @review = Review.new(teacher_id: @teacher.id, student_id: @student.id)
  end

  def create
    @review = Review.create(review_params)
    redirect_to teacher_path(@review.teacher.id)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review.update(review_params)
    flash[:message] = "Successfully edited review"
    redirect_to(session[:original_uri])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:message] = "Successfully deleted review"
    redirect_to(session[:original_uri])
  end


  def success_delete

  end

  def success_edit

  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :teacher_id, :student_id)
  end
end
