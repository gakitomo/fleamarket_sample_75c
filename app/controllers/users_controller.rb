class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end
  # POST /resource
  def create
    @user = User.new(user_params)
    @user.save
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

