class SessionsController < ApplicationController

  def new
  end

  def create
    if  params[:user].empty?
      render :new
    else
      user = Student.find_by(name: params[:user])
      session[:user_id] = user.id
      redirect_to welcome_path
    end
  end

  def destroy
    session[:user_id] = nil
    render :new
  end
end
