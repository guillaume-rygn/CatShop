class ChargesController < ApplicationController

    def new
        @cart = current_user.cart
        @amount = @cart.total
        @stripe_amount = (@amount * 100).to_i
    end
    
    def create
      # Amount in cents
      @amount = 500
      @cart = Cart.find_by(user_id: current_user.id)
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'usd',
      })
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end
