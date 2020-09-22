class PurchaseController < ApplicationController
  require "payjp"
  before_action :set_card, :set_item

  def index
    if @card.blank?
      
    else
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
    end
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      # :amount => @item.price,
      :amount => 300,
      :customer => @card.customer_id,
      :currency => "jpy"
    )
    redirect_to action: "done" #完了画面に移動
  end

  def done
  end

  private

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_item
    # @item = Item.find(params[:item_id])
  end

end
