class WelcomeController < ApplicationController

  def home
    @student = Student.find(session[:user_id])
    @hobbies = Hobby.random_selection
  end

  def teacher_home
    session[:original_uri] = request.url
    @teacher = Teacher.find(session[:user_id])
    @active_lessons = @teacher.lessons.select {|lesson| lesson.active == true}
    @waiting_for_approval = @teacher.lessons.select {|lesson| lesson.active == false && lesson.request == true }
  end
end
