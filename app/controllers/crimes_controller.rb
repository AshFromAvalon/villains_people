class CrimesController < ApplicationController
  before_action :set_crime, only: [:edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @crimes = Crime.all
  end

  def new
    @user = User.find(params[:user_id])
    @crime = current_user.crimes.new
    authorize @crime
  end

  def create
    @crime = current_user.crimes.new(crime_params)
    if @crime.save
      flash[:alert] = 'crime saved'
      redirect_to user_path(current_user)
    else
      render :new
    end
    authorize @crime
  end

  def edit
    @user = User.find(params[:user_id])
    authorize @crime
  end

  def update
    @user = User.find(params[:user_id])
    if @crime.update(crime_params)
      flash[:alert] = 'crime changed'
      redirect_to user_crimes_path(@user)
    else
      render :edit
    end
    authorize @crime
  end

  def destroy
    @user = User.find(params[:user_id])
    @crime.destroy
    redirect_to  user_crime_path(@user, @crime)
    authorize @crime
  end

  # private methods
  private

  def set_crime
    @crime = Crime.find(params[:id])
  end

  def crime_params
    params.require(:crime).permit(:name, :category, :price, :currency, :user_id)
  end
end
