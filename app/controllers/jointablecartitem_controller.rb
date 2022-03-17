class JointablecartitemController < ApplicationController

  before_action :authenticate_user

    def create
      
    addorupdateitem()
  
    respond_to do |format|
        format.html { redirect_to cart_path(Cart.find_by(user_id: current_user.id).id) }
        #format.js { }
      end
  end

  def update
    updatequantity()
  end

  def destroy
    @cart = JoinTableCartItem.find(params[:id])
    @cart.destroy
    
    respond_to do |format|
      format.html { redirect_to cart_path(params[:cart_id]) }
      format.js { }
    end
    
  end

  private

  def addorupdateitem
    @cart = Cart.find_by(user_id: current_user.id)
    i = 0
    a = ""
    @cart.join_table_cart_items.each do |item|
      if item.item_id.to_i == params[:item_id].to_i
        i = params[:quantity]
        a = item
        puts "$"*650
        puts i
      end
    end

    puts "$"*650
    puts i
    if i == 0
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
    else
      puts @cartitem
      b = a.quantity + params[:quantity].to_i
      a.update(quantity: b)
      total()
    end

  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_user_session_path
    end
  end

  def updatequantity
    @cartitem = JoinTableCartItem.find(params[:id])
 
    if params[:quantity].to_i != 0
      if @cartitem.update('quantity' => params[:quantity])
        redirect_to cart_path(current_user.cart.id)
      end
    end
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
