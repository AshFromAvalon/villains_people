class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @order = Order.find(params[:order_id])
  end

  def create
    @review = Review.new(review_params)
    @review.order = Order.find(params[:order_id])
    if @review.save
      flash[:alert] = 'review posted'
      redirect_to orders_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :title)
  end
end
