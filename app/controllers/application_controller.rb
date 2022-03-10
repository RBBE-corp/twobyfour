class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :underscore_remover

  private

  def underscore_remover(raw_string)
    capitalized_string = raw_string.capitalize
    capitalized_string.gsub("_", " ")
  end
end

def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
end
