class ReviewsController < ApplicationController

  def new
    # Both variables we create in here will be used to build simple_form
    # 1. find the restaurant that the review belongs to
    @restaurant = Restaurant.find(params[:restaurant_id])
    # 2. Instantiate the new Review to be used in the form
    @review = Review.new
  end

  def create
    # 1. instantiate the new review using information from the form
    @review = Review.new(review_params)
    # 2.0 find the restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    # 2. assign the restaurant to the review
    @review.restaurant = @restaurant
    # 3. save the review to the database
    if @review.save
      # 4. redirect the user somewhere
      redirect_to restaurant_path(@restaurant)
    else
      # 4. Render the new form again using same review we failed to save
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
