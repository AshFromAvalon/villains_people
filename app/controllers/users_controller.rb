class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end
end
