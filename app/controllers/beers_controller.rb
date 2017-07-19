class BeersController < ApplicationController
  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(new_beer_params)
    @beer.save
  end

  private

  def new_beer_params
    # binding.pry
    params.permit(:name, :type_of_beer, :alchohol_content)
  end
end
