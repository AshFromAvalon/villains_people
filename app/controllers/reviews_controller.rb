class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.order = Order.find(params[:order_id])
    @review.post_date = Date.current
    if @review.save
      flash[:alert] = 'review posted'
      @review.order.paid = true
      @review.order.save
      redirect_to orders_path
    else
      flash[:alert] = 'please leave a review before paying'
      redirect_to orders_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :title)
  end
end
