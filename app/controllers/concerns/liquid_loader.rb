module Concerns
  module LiquidLoader
    extend ActiveSupport::Concern

    included do
      before_action :setup_liquid
    end

    private

    def setup_liquid
      setup_liquid_tags
      setup_liquid_blocks
    end

    def setup_liquid_tags
      method_name = "#{action_name}_liquid_tags".to_sym
      tags = []
      tags = send(method_name) if respond_to?(method_name, true)

      tags = default_liquid_tags + tags

      tags.each do |tag|
        #TODO: Replace the immediate registeration with on demand
        #      registeration.
        tag_class = tag.constantize
        Liquid::Template.register_tag(tag_class.name, tag_class)
      end
    end

    def setup_liquid_blocks
      method_name = "#{action_name}_liquid_blocks".to_sym
      blocks = []
      blocks = send(method_name) if respond_to?(method_name, true)


      blocks.each do |blk|
        #TODO: Replace the immediate registeration with on demand
        #      registeration.
        blk_class = blk.constantize
        Liquid::Template.register_block(blk_class.name, blk_class)

      end
    end

    def default_liquid_tags
      [
        'Assets::StylesheetLinkTag',
        'Assets::JavascriptIncludeTag',
        'Assets::JavascriptIncludeTheme',
        'Site::SiteTitleTag',
      ]
    end
  end
end
