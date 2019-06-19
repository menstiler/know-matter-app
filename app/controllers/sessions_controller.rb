class SessionsController < ApplicationController

  def new
  end

  def create
    input = params[:username]
    if params[:username].empty?
      render :new
    else
      if Student.find_by(username: params[:username])
        user = Student.find_by(username: params[:username])
        session[:user_id] = user.id
        session[:user_type] = "student"
        redirect_to welcome_path
      else
        flash.now[:message] = "Enter a valid username"
        render :new
      end
    end
  end

  def destroy
    redirect_login = session[:user_type]
    session[:user_type] = nil
    session[:user_id] = nil
    if redirect_login == "teacher"
      render :new_teacher
    else
      render :new
    end
  end

  def new_teacher
  end

  def create_teacher
    if params[:username].empty?
      render :new_teacher
    else
      if Teacher.find_by(username: params[:username])
        user = Teacher.find_by(username: params[:username])
        session[:user_id] = user.id
        session[:user_type] = "teacher"
        redirect_to teacher_path(user)
      else
        flash.now[:message] = "Enter a valid username"
        render :new_teacher
      end
    end
  end
end
