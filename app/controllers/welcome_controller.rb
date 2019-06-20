class WelcomeController < ApplicationController

  def home
    @student = Student.find(session[:user_id])
    if @student.lessons.empty?
      @hobbies = Hobby.random_selection
    else
      @hobbies = @student.randomize_recommendation
    end
    @popular_hobbies = Hobby.top_three
    @lesson_message = @student.lessons.select {|lesson| lesson.message != nil && lesson.request == false}
  end

  def teacher_home
    session[:original_uri] = request.url
    @teacher = Teacher.find(session[:user_id])

    @lessons = @teacher.lessons
    @popular_hobbies = Hobby.top_three
    @recent_hobbies = Hobby.three_recent

    @active_lessons = @teacher.lessons.select {|lesson| lesson.active == true}
    @waiting_for_approval = @teacher.lessons.select {|lesson| lesson.active == false && lesson.request == true }
    @lesson_message = @teacher.lessons.select {|lesson| lesson.message != nil && lesson.request == true}
  end
end
