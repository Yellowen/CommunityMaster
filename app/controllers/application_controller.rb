class ApplicationController < ActionController::Base
  extend Faalis::I18n::Locale

  before_action :load_external_templates_path


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def load_external_templates_path
    #prepend_view_path CommunityMaster.external_view_path
    puts "HELLO" * 100, view_paths
  end
end
