class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :lessons]
  before_action :student_authorized, only: [:show, :edit, :lessons]

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
      session[:user_id] = @student.id
      session[:user_type] = "student"
      redirect_to welcome_path
    else
      flash.now[:message] = @student.errors.full_messages[0]
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
    @lessons = @student.lessons
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:username, :name, :age, :email, :profile_image)
  end
end
