class LessonsController < ApplicationController
  def book
    @teacher = Teacher.find(params[:id])
    @student = Student.find(session[:user_id])
    @lesson = Lesson.new(teacher_id: @teacher.id, student_id: @student.id)
  end

  def create_new_lesson

    @lesson = Lesson.create(lesson_params)
    byebug
  end


  private
  def lesson_params
    params.require(:lesson).permit(:time, :location, :teacher_id, :student_id)
  end

end
