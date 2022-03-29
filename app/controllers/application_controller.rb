class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :underscore_remover

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def underscore_remover(raw_string)
    capitalized_string = raw_string.capitalize
    capitalized_string.gsub("_", " ")
  end
  
end

def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
end

