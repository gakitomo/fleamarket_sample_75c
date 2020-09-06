# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    @user = User.new(sign_up_params)
    @user.birthday = "#{params[:birthday]["birthday(1i)"]}-#{params[:birthday]["birthday(2i)"]}-#{params[:birthday]["birthday(3i)"]}"
    if @user.save
      bypass_sign_in(@user)
      session["devise.regist_data"] = {user: @user.attributes}
      session["devise.regist_data"][:user]["password"] = params[:user][:password]
      redirect_to root_path
    else
      render :new
    end
  end
end
