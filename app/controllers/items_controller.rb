class ItemsController < ApplicationController
  def index
  end

  def show
    # @items = Item.all
    # @image = Image.find
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
