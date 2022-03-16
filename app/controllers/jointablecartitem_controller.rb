class JointablecartitemController < ApplicationController

  before_action :authenticate_user

    def create
    @cartitem = JoinTableCartItem.new(
      'item_id' => params[:item_id],
      'quantity' => params[:quantity],
      'cart_id' => Cart.find_by(user_id: current_user.id).id
    )

    total()

    if @cartitem.save
      flash[:notice] = "Item Add"
    else
      flash[:notice] = "please try again"
    end
  
    respond_to do |format|
        format.html { redirect_to cart_path(Cart.find_by(user_id: current_user.id).id) }
        #format.js { }
      end
  end

  def update
    @cartitem = JoinTableCartItem.find(params[:id])
 
    if @cartitem.update(cartitem_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @cart = JoinTableCartItem.find(params[:id])
    @cart.destroy
    redirect_to cart_path(params[:cart_id])
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
