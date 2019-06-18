class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :authorized
  helper_method :teacher_authorized
  helper_method :student_authorized

  def current_user
    if session[:user_type] == "student"
      @student = Student.find(session[:user_id])
    elsif session[:user_type] == "teacher"
      @teacher = Teacher.find(session[:user_id])
    end
  end

  def signed_in?
    !!current_user
  end

  def authorized
   redirect_to login_path unless signed_in?
  end

  def student_authorized
   redirect_to login_path unless signed_in? && session[:user_type] == "student"
  end

  def teacher_authorized
   redirect_to teacher_login_path unless signed_in? && session[:user_type] == "teacher"
  end

end
