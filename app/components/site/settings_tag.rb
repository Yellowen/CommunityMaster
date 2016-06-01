module Site
  class SettingsTag < ::Faalis::Liquid::Tag
    tag_name 'settings'

    argument name: :key

    def render(context)
      site = SiteFramework.current_site
      return site.settings.send(params[:key]) if params[:key]
      ''
    end
  end
end
