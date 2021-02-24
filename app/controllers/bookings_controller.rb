class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @theme = Theme.find(params[:theme_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @theme = Theme.find(params[:theme_id])
    @booking.theme = @theme
    @booking.user = current_user


    if @booking.save
      redirect_to theme_path(@theme), notice: "Booking was successfully created."
    else
      render :new
    end
  end

  def destroy
     @booking = Booking.find(params[:id])
     @booking.destroy
     redirect_to theme_path(@booking.theme_id)
  end

  private
  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date, :address)
  end
end
