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
    order = Order.new(
      'user_id' => current_user.id
    )

    order.save
    @order = Order.where(user_id: current_user.id).last
    joinitem()
    total()
    updatecart()

    redirect_to root_path # a user returns on his order
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

  def joinitem
    @cart = Cart.find_by(user_id: current_user.id)

    @cart.join_table_cart_items.each do |item|   
       article = JoinTableItemOrder.new(
        'item_id' => item.item_id,
        'quantity' => item.quantity,
        'order_id' => @order.id
      )
      if article.save
        puts"save"
      end
    end
  end

  def total 
    @total = 0
    @order.join_table_item_orders.each do |item|
      @total = @total + (item.item.price * item.quantity)
    end

    @order.update(total: @total)
  end

  def updatecart
    @cart = Cart.find_by(user_id: current_user.id)
    @article = @cart.join_table_cart_items
    
    @article.each do |item|
      item.destroy
    end
  end


end
