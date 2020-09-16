class ItemsController < ApplicationController
  def index
    @items = Item.all
    # @items = Item.includes(:image_ids).limit(5).order("created_at DESC")

    # if Item.buyer_id! = null
    # @items = Item.all
  end

  def show
    # @item = Item.find(params[:id])
    # @images = Item.images.find(params[:id])
  end

  def edit
  end

  def destroy
  end


  private
  def item_params
    params.require(:item).permit(:name, :price, {images: []})
  end

end
