class ApplicationController < ActionController::Base
  extend Faalis::I18n::Locale

  prepend_view_path CommunityMaster.external_view_path
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
