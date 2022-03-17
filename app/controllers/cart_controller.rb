class CartController < ApplicationController
  before_action :authenticate_user

  def show
    total()
    @amount = @cart.total
    @stripe_amount = (@amount * 100).to_i
  end

  def update

    updatecart()

    respond_to do |format|
      format.html { redirect_to cart_path(params[:cart_id]) }
      format.js { }
    end
    
  end

  private

  def updatecart
    @cart = Cart.find(params[:id])
    @article = @cart.join_table_cart_items
    
    @article.each do |item|
      item.destroy
    end
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_user_session_path
    end
  end

  def cartitem_params
    cartitem_params = params.require(:join_table_cart_items).permit(:quantity)
  end

  def total 
    @cart = Cart.find_by(user_id: current_user.id)
    @total = 0
    @cart.join_table_cart_items.each do |item|
      @total = @total + (item.item.price * item.quantity)
    end

    @cart.update(total: @total)
  end


end
