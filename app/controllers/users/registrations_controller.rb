# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_user_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/user
  def new
    @user = User.new
    @user.build_profile
  end

  # POST /resource
  def create
    @user = User.new(user_params)
    @user.build_profile(user_params[:profile_attributes])
    @user.build_profile(user_params[:profile_attributes])["birthday"] = "#{params[:birthday]["birthday(1i)"]}-#{params[:birthday]["birthday(2i)"]}-#{params[:birthday]["birthday(3i)"]}"
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    session[:profile_attributes] = user_params[:profile_attributes]
    session[:profile_attributes]["birthday"] = "#{params[:birthday]["birthday(1i)"]}-#{params[:birthday]["birthday(2i)"]}-#{params[:birthday]["birthday(3i)"]}"
    @address = @user.build_address
    render :new_address
  end

  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @profile = @user.build_profile(session[:profile_attributes])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.build_address(@address.attributes)
    @user.save
    @profile.save
    session["devise.regist_data"]["user"].clear
    session[:profile_attributes].clear
    bypass_sign_in(@user)
    redirect_to root_path
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      profile_attributes:
      [
        :family_name,
        :given_name,
        :family_name_kana,
        :given_name_kana,
        :birthday
      ]
    )
  end

  def address_params
    params.require(:address).permit(
      :address_first_name,
      :address_last_name,
      :address_first_name_kana,
      :address_last_name_kana,
      :address_number,
      :address_prefecture,
      :address_name,
      :address_block,
      :address_building,
      :address_phone_number
    )
  end


end
