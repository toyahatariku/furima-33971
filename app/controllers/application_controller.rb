class ApplicationController < ActionController::Base
  before_action :basic_auth

  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :nickname, :first_name, :second_name, :first_name_kana, :second_name_kana, :birthday])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'kuritahayato' && password == '123456'
    end
  end
end
