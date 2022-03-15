class CartController < ApplicationController
  before_action :authenticate_user!

    def create
    @cart = JoinTableCartItem.new(cart_params)

    if @cart.save
      flash[:notice] = "add to cart"
    else
      flash[:notice] = "Please try again"
    end
    puts"$"*650
    puts params.inspect
    respond_to do |format|
        format.html { redirect_to cart_path(params[:cart_id]) }
        #format.js { }
      end
  end

  def show
    @cart = Cart.find(params[:id])
    
  end

  def update

  end

  def destroy

  end

  private

  def cart_params
    params.permit(:item_id, :quantity, :cart_id)
  end

end
