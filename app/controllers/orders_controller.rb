class OrdersController < ApplicationController

  def index
    @orders = Order.where(user: current_user)
  end

  def new
    @order = Order.new
    @crime = Crime.find(params[:crime_id])
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.crime = Crime.find(params[:crime_id])
    if @order.save
      flash[:alert] = 'order saved'
      redirect_to orders_path
    else
      render :new
    end
  end

  # private methods
  private

  def set_order
    @order = order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:description, :crime_id)
  end
end
