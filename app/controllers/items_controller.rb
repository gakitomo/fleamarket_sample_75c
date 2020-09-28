class ItemsController < ApplicationController
  require "payjp"
  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show,:update, :destroy, :purchase, :pay, :done]
  before_action :set_card, only: [:purchase, :pay]
  before_action :set_item_buyer, only: [:purchase, :done]

  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  def index
    @items = Item.all.limit(5).order("created_at DESC")
  end

  def show
    @grandchild_category = @item.category
    if @grandchild_category.has_parent?
      @child_category = @grandchild_category.parent
      @parent_category = @child_category.parent
    end
  end

  def new
    @item = Item.new
    @item.images.new
  end


  def create
    @item = Item.new(item_params)
    
    if @item.save
      redirect_to root_path
    else
      @item.images.new
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])

    grandchild_category = @item.category
    child_category = grandchild_category.parent


    @category_parent_array = []
    
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
  
  end


  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path, notice: '削除できませんでした'
    end
  end


  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def purchase
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id) 
      @card_info = customer.cards.retrieve(customer.default_card)
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2,3)
      @card_brand = @card_info.brand
      case @card_brand
      when "Visa"
        @card_src = "cards/visa.gif"
      when "JCB"
        @card_src = "cards/jcb.gif"
      when "MasterCard"
        @card_src = "cards/mastercard.gif"
      when "American Express"
        @card_src = "cards/amex.gif"
      when "Diners Club"
        @card_src = "cards/diners.gif"
      end
      @address = Address.find_by(user_id: current_user.id)
    end
    if user_signed_in? && current_user.id == @item.seller_id
      redirect_to item_path
    end
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      :amount => @item.price,
      :customer => @card.customer_id,
      :currency => "jpy"
    )
    redirect_to action: "done"
  end

  def done
    @address = Address.find_by(user_id: current_user.id)
    if user_signed_in? && current_user.id == @item.seller_id
      redirect_to item_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description,:brand,:condition_id,:shipping_area_id,:shipping_method_id,:shipping_burden_id,:category_id,:seller_id,:buyer_id,:shipping_data,:price,:image_cache,images_attributes: [:src, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_item_buyer
    @item_buyer= Item.find(params[:id])
    @item_buyer.update(buyer_id: current_user.id)
  end

end

