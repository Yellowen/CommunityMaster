# REQUIRED TEST
module Assets
  class StylesheetThemeTag < ::Liquid::Tag
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
      'stylesheet_theme'
    end

    def initialize(name, args, options)
      super

      if args.nil? || args.empty?
        raise ArgumentError.new "'theme_name' argument is mandatory for 'stylesheet_theme'"
      end

      direction   = Faalis::I18n.direction(I18n.locale)

      @args = args.split(',').map(&:strip)

      @theme_name = @args[0].gsub('"', '').gsub("'", '')
      @media      = @args.fetch(1, :all).to_sym
      @remote     = @args.fetch(2, :true).to_s

      @manifest   = "#{@theme_name}/#{direction}/application"
    end

    def render(context)
      stylesheet_link_tag(@manifest, media: @media,
        'data-turbolinks-track' => @remote)

    end
  end
end
