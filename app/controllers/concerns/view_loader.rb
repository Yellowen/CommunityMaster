module Concerns
  # This concern included in application controller and is responsible
  # to inject suitable paths to `view_paths` based on current site
  module ViewLoader
    extend ActiveSupport::Concern

    PER_SITE_VIEWS_PATH = Rails.application.sites_tree

    included do
      # Override the view path. check the class method
      override_view_paths
    end

    module ClassMethods
      # Simple remove the default view path (the one which loads the view from
      # app/views). Sites should not have access to Mother App's views
      def override_view_paths
        tmp = view_paths.to_a
        tmp.shift
        self.view_paths = tmp
      end
    end

    private

    # This is a method to override the super method which is defined in
    # site framework. We altered the path creation process.
    def set_template_path
      if request.respond_to?(:site) && request.site
        # We are in site namespace
        unless request.site.default_template.blank?
          inject_views_paths(SiteFramework::Engine.view_path_prefix)
          #inject_assets_paths(request.site.default_template)
        end
      else
        prepend_view_path "#{Rails.root}/app/views"
      end
    end

    def inject_views_paths(prefix)
      prepend_view_path "#{prefix}/#{request.site.default_template}/views"

      domain = request.site.identifier_domain.to_fqdn
      prepend_view_path "#{PER_SITE_VIEWS_PATH}/#{domain}/views"
    end

    def inject_assets_paths(theme_name)
      assets_path = "#{theme_name}/assets/"

      if Rails.env.development? || Rails.env.test?
        theme_path = "#{Rails.root}/../template_master/templates/"
        override_path = "#{PER_SITE_VIEWS_PATH}/#{request.site.id}/assets/"
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
