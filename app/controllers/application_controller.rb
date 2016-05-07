class ApplicationController < ActionController::Base

  def self.override_view_paths
    tmp = view_paths.to_a
    tmp.shift
    self.view_paths = tmp
  end


  override_view_paths

  extend Faalis::I18n::Locale
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private


  def set_template_path
    if request.respond_to?(:site) && request.site
      # We are in site namespace
      unless request.site.default_template.blank?
        inject_views_paths(SiteFramework::Engine.view_path_prefix)

      end
    else
      prepend_view_path "#{Rails.root}/app/views"
    end
  end

  def inject_views_paths(prefix)
    prepend_view_path "#{prefix}/#{request.site.default_template}/views"
  end

  def inject_assets_paths(theme_name)
    assets_path = "#{theme_name}/assets/"

    if Rails.env.development? || Rails.env.test?
      theme_path = "#{Rails.root}/../template_master/templates/"
    else
      theme_path = "#{Rails.root}/../../shared/template_master/templates/"
    end

    assets_types.each do |type|
      path = "#{theme_path}#{assets_path}/#{type}"
      Rails.application.config.assets.paths << path
    end
  end

  def assets_types
    ['stylesheets', 'javascripts', 'fonts', 'images', 'audios', 'videos']
  end
end
