class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :lessons, :clear_lessons]
  before_action :student_authorized, only: [:edit, :lessons, :index]
  before_action :authorized, only: [:show]

  def index
    @students = Student.all
  end

  def show
    @reviews = @student.reviews
    @lessons = @student.lessons
    session[:original_uri] = request.url
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.valid?
      @student.save
      # UserMailer.welcome_email(@student).deliver_now
      session[:user_id] = @student.id
      session[:user_type] = "student"
      redirect_to welcome_path
    else
      flash.now[:message] = @student.errors.full_messages
      render :new
    end
  end

  def edit

  end

  def update
    @student.update(student_params)
    redirect_to @student
  end

  def destroy
    @student.destroy
    session[:user_id] = nil
    session[:user_path] = nil
    redirect_to login_path
  end

  def lessons
    session[:original_uri] = request.url
    @active_lessons = @student.lessons.select {|lesson| lesson.active == true}
    @inactive_lessons = @student.lessons.select {|lesson| lesson.active == false && lesson.request == false }
    @waiting_for_approval = @student.lessons.select {|lesson| lesson.active == false && lesson.request == true }
  end

  def clear_lessons
    inactive_lessons = @student.lessons.select {|lesson| lesson.active == false && lesson.request == false }
    inactive_lessons.each {|lesson| lesson.destroy }
    # byebug
    flash[:message] = "All canceled lesson have been deleted"
    redirect_to your_lessons_path(session[:user_id])
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:username, :name, :age, :email, :profile_image, :password)
  end
end
