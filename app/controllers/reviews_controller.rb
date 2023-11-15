class ReviewsController < ApplicationController
  before_action :set_restaurant

  # GET /restaurants/:restaurant_id/reviews/new
  def new
    @review = Review.new
  end

# POST /restaurants/:restaurant_id/reviews
def create
  @review = @restaurant.reviews.build(review_params)

  if @review.save
    redirect_to @restaurant, notice: 'Review was successfully created.'
  else
    flash.now[:alert] = 'There was an error creating the review.'
    render :new
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
