class CartController < ApplicationController
  before_action :authenticate_user

    def create
    @cartitem = JoinTableCartItem.new(
      'item_id' => params[:item_id],
      'quantity' => params[:quantity],
      'cart_id' => current_user.id
    )

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

  def show
    @cart = Cart.find_by(user_id: params[:user_id])
    
  end

  def update

  end

  def destroy

  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_user_session_path
    end
  end


end
