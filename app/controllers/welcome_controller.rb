class WelcomeController < ApplicationController

  def home
    @student = Student.find(session[:user_id])
    @hobbies = Hobby.random_selection
  end

  def teacher_home
    @teacher = Teacher.find(session[:user_id])
  end
end
