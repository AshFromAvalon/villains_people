class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def show
    @user = User.find(params[:id])
  end

  def index
    if params[:query]
      @users =  User.includes(:crimes).where('crimes.category' => params[:query])
    else
      @users =  User.includes(:crimes).where.not('crimes.id' => nil)
    end
  end

  def filter_index
    redirect_to action: "index", query: params[:query]
  end
end
