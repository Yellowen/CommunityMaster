module CommunityMaster
  module Liquid
    class Tag < ::Liquid::Tag

      def self.tag_name(name)
        @@name = name
      end

      def self.name
        @@name
      end
    end
  end
end
