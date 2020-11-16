class CrimesController < ApplicationController

  def index
    @crimes = Crime.all
  end

  def show
    set_crime
  end

  def new
    @crime = Crime.new
  end

  def create
    @crime = Crime.new(crime_params)
    @crime.user = current_user
    if @crime.save
      redirect_to new_crime_path
    else
      render :new
    end
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
