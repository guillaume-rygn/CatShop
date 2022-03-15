class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    order = Order.create(post_params)
    redirect_to order_path # a user returns on his order
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(post_params)
    redirect_to order_path
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to root_path #we can go to: an user dashboard, some order view (written: the order is on the way)
  end

  private

  def post_params
    params.require(:order).permit(:total, :user_id)
  end
end
