class WelcomeController < ApplicationController

  def home
    @student = Student.find(session[:user_id])
    if @student.lessons.empty?
      @hobbies = Hobby.random_selection
    else
      @hobbies = @student.randomize_recommendation
    end
    @popular_hobbies = Hobby.top_three
  end

  def teacher_home
    @teacher = Teacher.find(session[:user_id])
    @lessons = @teacher.lessons
    @popular_hobbies = Hobby.top_three
    @recent_hobbies = Hobby.three_recent
  end
end
