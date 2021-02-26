class ReviewsController < ApplicationController
  def create
    @theme = Theme.find(params[:theme_id])
    @review = Review.new(review_params)
    @review.theme = @theme
    authorize(@review)

    if @review.save
      redirect_to theme_path(@theme)
    else
      render 'themes/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
