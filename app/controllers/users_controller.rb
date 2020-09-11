class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    @user.birthday = "#{params[:birthday]["birthday(1i)"]}-#{params[:birthday]["birthday(2i)"]}-#{params[:birthday]["birthday(3i)"]}"
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end
  
  def edit
  end

  def update
  end

  def destroy
    @user.destroy
    redirect_to :root
  end

  private
  def sign_up_params
    params.require(:user).permit(:nickname, :email, :password, :family_name, :given_name, :family_name_kana, :given_name_kana, :birthday)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
