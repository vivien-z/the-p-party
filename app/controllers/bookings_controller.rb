class BookingsController < ApplicationController
  # def new
  #   @booking = Booking.new
  #   @theme = Theme.find(params[:theme_id])
  # end

  def create
    @booking = Booking.new(booking_params)
    @theme = Theme.find(params[:theme_id])
    @booking.theme = @theme
    @booking.user = current_user

    authorize(@booking)

    if @booking.save
      redirect_to theme_path(@theme), notice: "Booking was successfully created."
    else
      render @theme.new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize(@booking)
  end

  def update
    @booking = Booking.find(params[:id])

    authorize(@booking)

    if @booking.update(booking_params)
      redirect_to theme_path(@booking.theme.id), notice: "Booking was successfully update."
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    authorize(@booking)

    redirect_to theme_path(@booking.theme_id)
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date)
  end
end
