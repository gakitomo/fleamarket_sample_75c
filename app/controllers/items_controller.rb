class ItemsController < ApplicationController
  
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
  end

  def show
    @item = Item.find(params[:id])
  end

  def show
  end

  def create
  end

  def show
  end
  
  def edit
  end

  def update
  end

  def destroy
  end
end
