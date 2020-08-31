# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :create, only: [:complete]

  def create
    @user = User.new(sign_up_params)
    if @user.valid?
      render :action => 'confirm'
    else
     render :action => 'new'
    end
  end

  def complete
    render :action => 'complete'
  end
end
