class CartController < ApplicationController
  before_action :authenticate_user

  def show
    total()
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to root_path
  end

  private

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
      @total = @total + item.item.price
    end

    @cart.update(total: @total)
  end


end
