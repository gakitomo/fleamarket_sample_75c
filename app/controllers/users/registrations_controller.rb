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

  def destroy
    resource.soft_delete
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end
end
