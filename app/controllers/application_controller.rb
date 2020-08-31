class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected  

  def configure_permitted_parameters
    # strong parametersを設定し、user_idを許可
    devise_parameter_sanitizer.for(:sign_up){|u|
        u.permit(:user_id, :password, :password_confirmation)
    }
    devise_parameter_sanitizer.for(:sign_in){|u|
        u.permit(:user_id, :password, :remember_me)
    }
  end

  private

  def production?
    Rails.env.production?
  end
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end
end
