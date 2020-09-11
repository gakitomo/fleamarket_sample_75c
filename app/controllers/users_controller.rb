class UsersController < ApplicationController
  def index
    @users = User.all
  end

  # def new
  # end

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
    @user = User.find(id: params[:id])
  end
  
  def edit
  end

  def update
  end

  def destroy
    @user = User.find(params[:id]) #特定のidを持つ情報を取得
    @user.destroy
    redirect_to :root #削除に成功すればrootページに戻る
  end

  private
  def sign_up_params
    params.require(:user).permit(:nickname, :email, :password, :family_name, :given_name, :family_name_kana, :given_name_kana, :birthday)
  end

end
