class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show]
  before_action :authorized

  def index
    @teachers = Teacher.all
  end

  def show
    @reviews = @teacher.reviews
    session[:original_uri] = request.url 
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
end
