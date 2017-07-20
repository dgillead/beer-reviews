class ReviewsController < ApplicationController
  before_action :find_beer
  before_action :authenticate_user!

  def new
    @review = @beer.reviews.new
    render :new, locals: { beer: @beer, review: @review }
  end


  private

  def find_beer
    @beer = Beer.find_by(id: params[:beer_id])
  end
end
