class LessonsController < ApplicationController

  def create_new_lesson
    @lesson = Lesson.find(params[:id])
    booking = @lesson.teacher.bookings.find {|booking| booking.timeslot.timeslot == @lesson.time }
    booking.update(status: false)
    @lesson.update(request: false)
    @lesson.update(message: "#{@lesson.teacher.hobby.subclass} lesson has been approved by #{@lesson.teacher.name}")
    @lesson.update(active: true)
    flash[:message] = "Lesson has been booked"
    redirect_to(session[:original_uri])
  end

  def request_new_lesson
    if Student.find(session[:user_id]).my_timeslots.include?(params[:lesson][:time])
      flash[:message] = "You already have a lesson at this time"
      redirect_to(session[:original_uri])
    else
      @lesson = Lesson.create(lesson_params)
      @lesson.update(request: true)
      @lesson.update(active: false)
      @lesson.update(message: "#{@lesson.student.name}'s booking is waiting approval")
      redirect_to thank_you_path(@lesson)
    end
  end

  def remove_message
    @lesson = Lesson.find(params[:id])
    @lesson.update(message: nil)
    redirect_to welcome_path
  end

  def teacher_remove_message
    @lesson = Lesson.find(params[:id])
    @lesson.update(message: nil)
    redirect_to teacher_welcome_path
  end

  def thank_you
    @lesson = Lesson.find(params[:id])
    @student = Student.find(session[:user_id])
    @teacher = Teacher.find(@lesson.teacher.id)
  end

  def request_cancel
    @lesson = Lesson.find(params[:id])
    @lesson.update(request: true)
    @lesson.update(message: "#{@lesson.student.name} cancelation is waiting approval")
    redirect_to(your_lessons_path(session[:user_id]))
  end

  def cancel_lesson
    @lesson = Lesson.find(params[:id])
    @student = Student.find(@lesson.student.id)
    booking = @lesson.teacher.bookings.find {|booking| booking.timeslot.timeslot == @lesson.time }
    booking.update(status: true)
    if @lesson.active
      @lesson.update(message: "#{@lesson.teacher.hobby.subclass} lesson has been canceled by #{@lesson.teacher.name}")
    else
      @lesson.update(message: nil)
    end
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
