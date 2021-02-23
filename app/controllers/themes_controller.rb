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

  def edit
    @theme = Theme.find(params[:id])
  end

  def update
    @theme = Theme.find(params[:id])
    @theme.update(theme_params)
    redirect_to theme_path(@theme)
  end

  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy
    redirect_to themes_path
  end

  private

  def theme_params
    params.require(:theme).permit(:name, :description, :price_cent, :number_people)
  end
end
