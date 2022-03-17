class ItemsController < ApplicationController
  def index
    @category = Category.all
    switchCategory()
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.all.sort_by {rand}[0..5]
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.create(post_params)
    redirect_to item_path(item.id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(post_params)
    redirect_to items_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def post_params
    params.require(:item).permit(:title, :description, :price, :image_url, :category)
  end

  def switchCategory
    if params[:category].nil? || params[:category] == "all cats"
      @items = Item.all
    else
      @items = []
      Item.all.each do |item|
        if item.category_id == params[:category].to_i
          @items << item
        end
      end
      
    end
  end
end
