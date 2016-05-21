module Assets
  class JavascriptIncludeTheme < JavascriptIncludeTag

    def self.name
      'javascript_include_theme'
    end

    def initialize(name, args, options)
      super

      if args.nil? || args.empty?
        raise ArgumentError.new "'theme_name' argument is mandatory for 'javascript_include_tag'"
      end

      @manifest = "#{args.strip}/application"
      @remote   = true
    end
  end
end
