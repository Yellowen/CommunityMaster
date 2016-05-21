module Assets
  class JavascriptIncludeTag < ::Liquid::Tag
    include Sprockets::Rails::Helper

    self.assets_prefix       = Rails.application.config.assets.prefix
    self.assets_environment  = Rails.application.assets
    self.digest_assets       = Rails.application.config.assets[:digest]
    self.assets_manifest     = Rails.application.assets_manifest
    self.debug_assets        = Rails.application.config.assets[:debug]
    self.resolve_assets_with = Rails.application.config.assets.resolve_with
    self.precompiled_asset_checker = -> logical_path {
      #Rails.application.asset_precompiled?(logical_path)
      true
    }

    def self.name
      'javascript_include_tag'
    end

    def initialize(name, args, options)
      super

      @args = args.split(',').map(&:strip)

      @file       = @args[0].gsub('"', '').gsub("'", '')
      @remote     = @args.fetch(1, :true).to_s

      @manifest = @file
    end

    def render(context)
      javascript_include_tag(@manifest, 'data-turbolinks-track' => @remote)
    end
  end
end
