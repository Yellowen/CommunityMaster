class ApplicationController < ActionController::Base

  include Concerns::LiquidLoader
  include Concerns::ViewLoader
  extend Faalis::I18n::Locale

  # rescue_from Exception do |e|

  # end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def not_found(e)
  end
end
