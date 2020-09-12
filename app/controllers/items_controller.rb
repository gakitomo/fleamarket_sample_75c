class ItemsController < ApplicationController
  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @items = Item.all
    @items = Item.includes(:images).order('created_at DESC')
    
  end

  def new
    @item = Item.new
    @item.images.new
    @parents = Category.where(ancestry: nil)
  def show
    @item = Item.find(params[:id])
  end

  def show
  end

  def create
    @item = Item.create!(item_params)
    if @item.save
     redirect_to root_path
    else
     render :new
    end
   end

   def edit
    #カテゴリーデータ取得
    @grandchild_category = @item.category
    @child_category = @grandchild_category.parent 
    @category_parent = @child_category.parent
  
    #カテゴリー一覧を作成
    @category = Category.find(params[:id])
    # 紐づく孫カテゴリーの親（子カテゴリー）の一覧を配列で取得
    @category_children = @item.category.parent.parent.children
    # 紐づく孫カテゴリーの一覧を配列で取得
    @category_grandchildren = @item.category.parent.children
  end

  #  before_action :set_item, except: [:index, :new, :create]

  # def update
  #   if @item.update(item_prams)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end


  
  

  private
  def item_params
    params.require(:item).permit(:name, :description,:brand,:condition_id,:shipping_area_id,:shipping_method_id,:shipping_burden_id,:category_id,:seller_id,:buyer_id,:shipping_data,:price,images_attributes: [:src, :_destroy, :id])
  end

  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end

  # def set_item
  #   @item = Item.find(params[:id])
  #  end

end