module Utils
  class PageDirectionTag < ::Faalis::Liquid::Tag

    tag_name 'page_direction'

    def render(context)
      Faalis::I18n.direction(I18n.locale)
    end
  end
end
