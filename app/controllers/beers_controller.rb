class BeersController < ApplicationController
  before_action :find_beer, only: [:show, :update, :edit, :destroy]

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(new_beer_params)
    if @beer.save
      redirect_to @beer
    else
      render :new, locals: { beer: @beer }
    end
  end

  def show
    render :show, locals: { beer: @beer }
  end

  private

  def find_beer
    @beer = Beer.find_by(id: params[:id])
  end

  def new_beer_params
    params.require(:beer).permit(:name, :type_of_beer, :alchohol_content)
  end
end
