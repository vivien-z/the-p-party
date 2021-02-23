class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user

    if booking.save
      redirect_to @booking, notice: "Booking was successfully created."
    else
      render :new
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date, :address)
  end
end
