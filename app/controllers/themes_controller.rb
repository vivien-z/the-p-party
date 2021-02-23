class ThemesController < ApplicationController
  def index
    @themes = Theme.all
  end

  def show
    @theme = Theme.find(params[:id])
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(theme_params)
    @theme.user = current_user
    if @theme.save
      redirect_to theme_path(@theme)
    else
      render 'theme/new'
    end
  end

  private

  def theme_params
    params.require(:theme).permit(:name, :description, :price_cent, :number_people)
  end
end

