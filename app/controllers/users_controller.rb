class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def show
    @user = User.find(params[:id])
  end

  def index
    if params[:category] && params[:category].keys.any?
      @users = User.includes(:crimes).where(crimes: { category: params[:category].keys })
    else
      @users =  User.includes(:crimes).where.not('crimes.id' => nil)
    end
  end

  # def filter_index
  #   #isolate params that are in our crimes list
  #   selected_crimes = params.keys.select { |crime| Crime::CATEGORIES.include?(crime) }
  #   redirect_to action: "index", query: selected_crimes
  # end
end
