class CartController < ApplicationController
  before_action :authenticate_user!

    def create
    @cart = JoinTableCartItem.new(cart_params)

    if @cart.save
      redirect_to root_path
      flash[:notice] = "add to cart"
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end

    respond_to do |format|
        format.html { redirect_to root_path }
        #format.js { }
      end
  end

  def show
    @cart = JoinTableCartItem.find(Cart.find_by(user_id: params[:id]).id)
    
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
