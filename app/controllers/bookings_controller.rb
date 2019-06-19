class BookingsController < ApplicationController


  def new
    @timeslot = Timeslot.new
    @teacher = Teacher.find(session[:user_id])
    @days = Timeslot.all_days
    @times = Timeslot.all_times
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

  def destroy
    @booking = Booking.find(params[:id])
    @teacher = @booking.teacher
    @booking.delete
    redirect_to teacher_path(@teacher)
  end

  private
  def booking_params
    params.require(:booking).permit(:timeslot_id, :teacher_id, :status)
  end

end
