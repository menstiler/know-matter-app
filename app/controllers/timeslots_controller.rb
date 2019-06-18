class TimeslotsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @timeslot = Timeslot.new
    @booking = Booking.new
    @days = ['Mondays','Tuesdays','Wednesdays','Thursdays','Fridays','Saturdays','Sundays']
    @times = ['9am - 10am','10am - 11am','11am - 12pm','1pm - 2pm','2pm - 3pm','3pm - 4pm','4pm - 5pm','5pm - 6pm','6pm - 7pm','7pm - 8pm']
  end

  def create
    timeslot = params[:timeslot][:day] + ": " + params[:timeslot][:time]
    @timeslot = Timeslot.new(:timeslot => timeslot, :day => params[:timeslot][:day], :time => params[:timeslot][:time])

    if @timeslot.valid?
      redirect_to new_booking_path
    else
      flash[:message] = @timeslot.errors.full_messages[0]
      redirect_to new_timeslot_path
    end
  end

  private
  def timeslot_params
    params.require(:timeslot).permit(:timeslot, :day, :time)
  end
end
