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
        @card_src = image_tag(image_path('cards/visa.gif'), class: 'visa')
      when "JCB"
        @card_src = "jcb.gif"
      when "MasterCard"
        @card_src = "mastercard.gif"
      when "American Express"
        @card_src = "amex.gif"
      when "Diners Club"
        @card_src = "diners.gif"
      end
      ## 有効期限'月'を定義
      @exp_month = @card_info.exp_month.to_s
      ## 有効期限'年'を定義
      @exp_year = @card_info.exp_year.to_s.slice(2,3)
    end
  end

  def new
    # @card = Card.where(user_id: current_user.id).first
    @card = Card.new
    # redirect_to action: "index" if @card.present?  
  end

  def create
    # PAY.JPの秘密鍵をセット（環境変数）
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
        redirect_to action: "create"
      else
        redirect_to action: "new"
      end
    end
  end

  def show
    @card = Card.find_by(user_id: current_user.id)
    if @card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @customer_card = customer.cards.retrieve(@card.card_id)
      @card_brand = @customer_card.brand
      case @card_brand
      when "Visa"
        @card_src = "visa.gif"
      when "JCB"
        @card_src = "jcb.gif"
      when "MasterCard"
        @card_src = "mastercard.gif"
      when "American Express"
        @card_src = "amex.gif"
      when "Diners Club"
        @card_src = "diners.gif"
      end

      ## 有効期限'月'を定義
      @exp_month = @customer_card.exp_month.to_s
      ## 有効期限'年'を定義
      @exp_year = @customer_card.exp_year.to_s.slice(2,3)
    end
  end

  def destroy     
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete # PAY.JPの顧客情報を削除
    if @card.destroy # App上でもクレジットカードを削除
      redirect_to action: "index", notice: "削除しました"
    else
      redirect_to action: "index", alert: "削除できませんでした"
    end
  end

  # def buy
  #   @product = Product.find(params[:product_id])
   
  #   if @product.buyer.present? 
  #     redirect_back(fallback_location: root_path) 
  #   elsif @card.blank?
      
  #     redirect_to action: "new"
  #     flash[:alert] = '購入にはクレジットカード登録が必要です'
  #   else
      
  #     Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      
  #     Payjp::Charge.create(
  #     amount: @product.price,
  #     customer: @card.customer_id,
  #     currency: 'jpy',
  #     )
      
  #     if @product.update(buyer_id: current_user.id)
  #       flash[:notice] = '購入しました。'
  #       redirect_to controller: 'products', action: 'show', id: @product.id
  #     else
  #       flash[:alert] = '購入に失敗しました。'
  #       redirect_to controller: 'products', action: 'show', id: @product.id
  #     end
  #   end
  # end

  private
  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end