class LessonsController < ApplicationController

  def create_new_lesson
    @lesson = Lesson.create(lesson_params)
    booking = @lesson.teacher.bookings.find {|booking| booking.timeslot.timeslot == @lesson.time }
    booking.update(status: "Booked")
    redirect_to thank_you_path
  end

  def thank_you
    @student = Student.find(session[:user_id])
  end


  def cancel_lesson
    @lesson = Lesson.find(params[:id])
    @student = Student.find(@lesson.student.id)
    booking = @lesson.teacher.bookings.find {|booking| booking.timeslot.timeslot == @lesson.time }
    booking.update(status: "Available")
    @lesson.destroy
    flash.now[:notice] = "Successfully canceled lesson"
    redirect_to "/students/#{session[:user_id]}/lessons"
  end

  private

  def lesson_params
    params.require(:lesson).permit(:time, :location, :teacher_id, :student_id)
  end

end
