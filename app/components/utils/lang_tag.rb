module Utils
  class LangTag < ::CommunityMaster::Liquid::Tag

    tag_name 'lang'

    def render(context)
      I18n.locale.to_s
    end
  end
end
