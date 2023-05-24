class ReviewsController < ApplicationController
  before_action :set_restaurant

    def index
      @reviews = Review.all
    end

    def show
    end

  # GET /restaurants/:restaurant_id/reviews/new
  def new
    @review = @restaurant.reviews.new
  end

  # POST /restaurants/:restaurant_id/reviews
  def create
    @review = @restaurant.reviews.new(review_params)

    if @review.save
      redirect_to restaurant_url(@restaurant), notice: "Review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
