class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    authorize(@review)

    if @review.save
      redirect_to theme_path(@booking.theme)
    else
      render 'themes/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
