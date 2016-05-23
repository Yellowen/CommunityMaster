require 'ostruct'

module Concerns
  module Site
    module Settings
      extend ActiveSupport::Concern

      def settings
        @settings ||= OpenStruct.new(raw_settings)
      end

      def raw_settings
        read_attribute(:settings)
      end
    end
  end
end
