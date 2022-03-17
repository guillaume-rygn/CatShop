module Admin
    
    class ItemsController < ApplicationController
        
        def index
            @items = Item.all
            
        end

        def new
            @item = Item.new
            puts "$"*100
            
        end
        
        def create
            @item = Item.create(
                'title' => params[:title],
                'description' => params[:description],
                'price' => params[:price],
                'image_url' => params[:image_url]
            )

            if @item.save
            redirect_to admin_items_path
            else
                render :new
            end
        end

        def update

            if @items.update(post_params)
                redirect_to item_path(item.id)
                else
                    render :new
                end
            
        end
        
        def destroy
            @items.destroy
            redirect_to root_path
        end

        private


        def post_params
            params.require(:item).permit(:title, :description, :price, :image_url)
        end

    end
end
