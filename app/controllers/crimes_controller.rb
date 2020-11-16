class CrimesController < ApplicationController
  def new
    @crime = Crime.new
  end

  def create
    @crime = Crime.new(crime_params)

    if @crime.save

      redirect_to new_crime_path
    else
      render :new
    end
  end

  private
  def crime_params
    params.require(:crime).permit(:name, :category, :price, :currency)
  end
end
