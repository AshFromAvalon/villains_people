class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def show
    @user = User.find(params[:id])
    @reviews = Review.all.select do |review|
      review.order.user_id == params[:id].to_i
    end
    @ratings = @reviews.map { |review| review.rating }
    @average_rating = @ratings.sum.fdiv(@ratings.size)
  end

  def index
     if params[:category] && params[:category].keys.any?
      @users = User.includes(:crimes).where(crimes: { category: params[:category].keys })
    else
      @users =  User.includes(:crimes).where.not('crimes.id' => nil)
    end
  end

end
