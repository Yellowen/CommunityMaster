module Concerns
  # This concern included in application controller and is responsible
  # to inject suitable paths to `view_paths` based on current site
  module ViewLoader
    extend ActiveSupport::Concern

    PER_SITE_VIEWS_PATH = Rails.application.sites_tree

    private

    # This is a method to override the super method which is defined in
    # site framework. We altered the path creation process.
    def set_template_path
      #if request.respond_to?(:site) && SiteFramework.current_site
      if SiteFramework.current_site
        # We are in site namespace
        unless SiteFramework.current_site.default_template.blank?
          inject_views_paths(SiteFramework::Engine.view_path_prefix)
          inject_assets_paths(SiteFramework.current_site.default_template)
          remove_default_paths
        end
        #else
        #prepend_view_path "#{Rails.root}/app/views"
      end

    end

    def remove_default_paths
      return self._view_paths = @site_view_paths if @site_view_paths

      tmp = view_paths.select do |p|
        !p.to_s.start_with? Rails.root.to_s
      end

      self._view_paths = ActionView::PathSet.new(tmp)
      @site_view_paths = self.view_paths

    end

    def inject_views_paths(prefix)
      prepend_view_path "#{prefix}/#{SiteFramework.current_site.default_template}/views"

      domain = SiteFramework.current_site.identifier_domain.to_fqdn
      prepend_view_path "#{PER_SITE_VIEWS_PATH}/#{domain}/views"
    end

    def inject_assets_paths(theme_name)
      assets_path = "#{theme_name}/assets/"

      if Rails.env.development? || Rails.env.test?
        theme_path = "#{Rails.root}/../template_master/templates/"
        override_path = "#{PER_SITE_VIEWS_PATH}/#{SiteFramework.current_site.id}/assets/"
      else
        theme_path = "#{Rails.root}/../../shared/template_master/templates/"
        override_path = nil
      end

      assets_types.each do |type|
        path  = "#{theme_path}#{assets_path}#{type}"

        # Path for each site specific assets
        spath = "#{override_path}#{type}"

        Rails.application.config.assets.paths << spath if override_path
        Rails.application.config.assets.paths << path
      end
    end

    def assets_types
      ['stylesheets', 'javascripts', 'fonts', 'images', 'audios', 'videos']
    end

  end
end
