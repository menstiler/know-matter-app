class TeachersController < ApplicationController
  before_action :authorized

  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
    @reviews = @teacher.reviews
  end


end
