class CrimesController < ApplicationController
  before_action :set_crime, only: [:edit, :update, :destroy]

  def index
    @crimes = Crime.all
  end

  def new
    @crime = Crime.new
  end

  def create
    @crime = Crime.new(crime_params)
    @crime.user = current_user
    if @crime.save
      flash[:alert] = 'crime saved'
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @crime.update(crime_params)
      flash[:alert] = 'crime changed'
      redirect_to crimes_path
    else
      render :edit
    end
  end

  def destroy
    @crime.destroy
    redirect_to crimes_path
  end

  # private methods
  private

  def set_crime
    @crime = Crime.find(params[:id])
  end

  def crime_params
    params.require(:crime).permit(:name, :category, :price, :currency)
  end
end
