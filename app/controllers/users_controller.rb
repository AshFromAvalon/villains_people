class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @user = User.find(params[:id])
    @reviews = Review.all.select do |review|
      review.order.crime.user_id == params[:id].to_i
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
    @markers = @users.geocoded.map do |user|
      url = user.profile_pic.attached? ? url_for(user.profile_pic) : helpers.asset_url('Profile_avatar_placeholder.png')
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: url
      }
    end
  end
end
