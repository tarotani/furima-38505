class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'user' && password == '1111'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sigh_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday]) 
  end
end
