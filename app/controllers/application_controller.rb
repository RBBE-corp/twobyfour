class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :underscore_remover
 
  private

  def underscore_remover(raw_string)
    raw_string.capitalize!
    raw_string.gsub("_", " ")  
  end
end
