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

  def missions
    @missions_tovalidate = []
    @missions_tofinish = []
    @missions_topay = []
    @missions_archived = []
    Order.all.each do |order|
      if order.crime.user == current_user
        if order.paid
          @missions_archived << order
        elsif order.done
          @missions_topay << order
        elsif order.validated
          @missions_tofinish << order
        else
          @missions_tovalidate << order
        end
      end
    end
  end

  def validate
    set_order
    @order.validated = true
    @order.save
    redirect_to missions_orders_path
  end

  def pay
    set_order
    @order.paid = true
    @order.save
    redirect_to missions_orders_path
  end

  def done
    set_order
    @order.done = true
    @order.save
    redirect_to missions_orders_path
  end

  # private methods
  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:description)
  end
end
