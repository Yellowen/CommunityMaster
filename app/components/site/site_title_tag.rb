module Site
  class SiteTitleTag < ::Faalis::Liquid::Tag
    tag_name 'site_title'

    def render(context)
      site = ::SiteFramework.current_site
      site.title
    end
  end
end
