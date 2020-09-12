class ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
    # @image = Image.find(params[:id])
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
