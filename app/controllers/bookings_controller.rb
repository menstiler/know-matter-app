class BookingsController < ApplicationController


  def new
    @booking = Booking.new
    @teacher = Teacher.find(session[:user_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @teacher = @booking.teacher
    if @booking.valid?
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
