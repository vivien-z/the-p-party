class ThemesController < ApplicationController
  def index
    @themes = policy_scope(Theme)
  end

  def show
    @theme = Theme.find(params[:id])
    @booking = Booking.new
    authorize(@theme)
  end

  def new
    @theme = Theme.new
    authorize(@theme)
  end

  def create
    @theme = Theme.new(theme_params)
    @theme.user = current_user
    authorize(@theme)

    if @theme.save
      redirect_to theme_path(@theme)
    else
      render 'new'
    end
  end

  def edit
    @theme = Theme.find(params[:id])
    authorize(@theme)
  end

  def update
    @theme = Theme.find(params[:id])
    authorize(@theme)

    if @theme.update(theme_params)
      redirect_to theme_path(@theme)
    else
      render :edit
    end
  end

  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy
    authorize(@theme)
    redirect_to themes_path
  end

  private

  def theme_params
    params.require(:theme).permit(:name, :description, :address, :price_cent, :number_people, photos: [])
  end
end
