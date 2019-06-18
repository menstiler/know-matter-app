class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:user].empty?
      render :new
    else
      user = Student.find_by(name: params[:user])
      session[:user_id] = user.id
      session[:user_type] = "student"
      redirect_to welcome_path
    end
  end

  def destroy
    session[:user_type] = nil
    session[:user_id] = nil
    render :new
  end

  def new_teacher
  end

  def create_teacher
    if params[:user].empty?
      render :new_teacher
    else
      user = Teacher.find_by(name: params[:user])
      session[:user_id] = user.id
      session[:user_type] = "teacher"
      redirect_to teacher_path(user)
    end
  end
end
