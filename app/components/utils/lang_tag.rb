module Utils
  class LangTag < ::Faalis::Liquid::Tag

    tag_name 'lang'

    def render(context)
      I18n.locale.to_s
    end
  end
end
