class LessonsController < ApplicationController

  def create_new_lesson
    @lesson = Lesson.find(params[:id])
    booking = @lesson.teacher.bookings.find {|booking| booking.timeslot.timeslot == @lesson.time }
    booking.update(status: false)
    @lesson.update(request: false)
    @lesson.update(active: true)
    flash[:message] = "Lesson has been booked"
    redirect_to(session[:original_uri])
  end

  def request_new_lesson
    @lesson = Lesson.create(lesson_params)
    @lesson.update(request: true)
    @lesson.update(active: false)
    redirect_to thank_you_path
  end

  def thank_you
    @student = Student.find(session[:user_id])
    @teacher = Teacher.find(@student.teachers.last.id)
  end

  def request_cancel
    @lesson = Lesson.find(params[:id])
    @lesson.update(request: true)
    redirect_to(your_lessons_path(session[:user_id]))
  end

  def cancel_lesson
    @lesson = Lesson.find(params[:id])
    @student = Student.find(@lesson.student.id)
    booking = @lesson.teacher.bookings.find {|booking| booking.timeslot.timeslot == @lesson.time }
    booking.update(status: true)
    @lesson.update(active: false)
    @lesson.update(request: false)
    flash[:message] = "Successfully canceled lesson"
    redirect_to(session[:original_uri])
  end

  private

  def lesson_params
    params.require(:lesson).permit(:time, :location, :teacher_id, :student_id)
  end

end
