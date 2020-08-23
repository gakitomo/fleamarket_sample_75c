class CardsController < ApplicationController
  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to card_path(current_user_id) if card.exists?
  end



end
