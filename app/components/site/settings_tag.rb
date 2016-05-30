module Site
  class SettingsTag < ::CommunityMaster::Liquid::Tag
    tag_name 'settings'

    argument name: :key

    def render(context)
      site = SiteFramework.current_site
      return site.settings.send(params[:key]) if params[:key]
      ''
    end
  end
end
