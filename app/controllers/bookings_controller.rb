class BookingsController < ApplicationController


  def new
    @timeslot = Timeslot.new
    @teacher = Teacher.find(session[:user_id])
    @days = Date::DAYNAMES
    @times = ['9am - 10am','10am - 11am','11am - 12pm','1pm - 2pm','2pm - 3pm','3pm - 4pm','4pm - 5pm','5pm - 6pm','6pm - 7pm','7pm - 8pm']
  end

  def create
    timeslot = params[:day] + ": " + params[:time]
    @timeslot = Timeslot.find_by(timeslot: timeslot)
    @teacher = Teacher.find(session[:user_id])
    @booking = Booking.new(teacher_id: @teacher.id, timeslot_id: @timeslot.id, status: "Available")
    if @booking.valid?
      @booking.save
      redirect_to teacher_path(@teacher)
    else
      flash[:message] = @booking.errors.full_messages[0]
      redirect_to new_booking_path
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:timeslot_id, :teacher_id, :status)
  end
end
