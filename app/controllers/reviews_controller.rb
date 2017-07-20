class ReviewsController < ApplicationController
  before_action :find_beer
  before_action :authenticate_user!

  def new
    review = @beer.reviews.new
    render :new, locals: { beer: @beer, review: review }
  end

  def index
    reviews = @beer.reviews.all
    render :index, locals: { beer: @beer, reviews: reviews }
  end

  def create
    review = @beer.reviews.new(review_params)
    if review.save
      redirect_to [@beer, review]
    else
      render :new, locals: { beer: @beer, review: @review }
    end
  end

  def edit
    review = @beer.reviews.find_by(id: params[:id])
    render :edit, locals: { beer: @beer, review: review }
  end

  def update
    review = @beer.reviews.find_by(id: params[:id])
    review.update(review_params)
    redirect_to "/beers/#{@beer.id}/reviews"
  end

  def show
    review = @beer.reviews.find_by(id: params[:id])
    render :show, locals: { beer: @beer, review: review }
  end

  def destroy
    review = @beer.reviews.find_by(id: params[:id])
    review.destroy
    redirect_to "/beers/#{@beer.id}/reviews"
  end

  private

  def find_beer
    @beer = Beer.find_by(id: params[:beer_id])
  end

  def review_params
    params.require(:review).permit(:review_text)
  end
end
