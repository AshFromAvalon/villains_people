class OrdersController < ApplicationController
  before_action :set_order, only: [:validate, :pay, :done]

  def index
    @orders = Order.where(user: current_user)
  end

  def new
    @order = current_user.orders.new
    @user = User.find(params[:user_id])
    @crime = Crime.find(params[:crime_id])
    authorize @order
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.crime = Crime.find(params[:crime_id])
    if @order.save
      flash[:alert] = 'order saved'
      redirect_to orders_path
    else
      render :new
    end
    authorize @order
  end

  # missions display all the orders for which I have to make a crime
  def missions
    # I create 4 arrays for each status
    @missions_tovalidate = []
    @missions_tofinish = []
    @missions_topay = []
    @missions_archived = []
    # For each order
    Order.all.each do |order|
      # I only select the ones for my crimes
      if order.crime.user == current_user
        # I split my orders per status defined here-over
        if order.paid
          @missions_archived << order
        elsif order.done
          @missions_topay << order
        elsif order.validated
          @missions_tofinish << order
        else
          # If all booleans are FALSE, then it needs to be accepted
          @missions_tovalidate << order
        end
      end
    end
    authorize Order.all
  end

  # validated = true PATCH order
  def validate
    set_order
    @order.validated = true
    @order.save
    redirect_to missions_orders_path
    authorize @order
  end

  # paid = true PATCH order
  def pay
    set_order
    @order.paid = true
    @order.save
    redirect_to missions_orders_path
    authorize @order
  end

  # done = true PATCH order
  def done
    set_order
    @order.done = true
    @order.save
    redirect_to missions_orders_path
    authorize @order
  end

  # private methods
  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:description, :user_id, :crime_id)
  end
end
