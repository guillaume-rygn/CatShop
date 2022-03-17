module Admin
    class OrdersController < ApplicationController
        

        
        def index
            @orders = Order.all
        end
        
    end
end