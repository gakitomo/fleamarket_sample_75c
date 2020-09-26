class CardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def index
    @card = Card.find_by(user_id: current_user.id)
    if @card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(customer.default_card)
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
      
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2,3)
    end
  end

  def new
    @card = Card.new 
  end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjpToken'].blank?
      render "new"
    else
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjpToken'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "create", notice: "カードを登録しました"
      else
        redirect_to new_card_path, alert: "カードを登録できませんでした"
      end
    end
  end

  def show
  end

  def destroy
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    @card.delete
    if @card.destroy
      redirect_to action: "destroy", notice: "削除しました"
    else
      redirect_to card_path(current_user.id), alert: "削除できませんでした"
    end
  end

  def purchase
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      :amount => @item.price,
      :customer => @card.customer_id,
      :currency => "jpy"
    )
    redirect_to action: "done"
  end

  private
  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end