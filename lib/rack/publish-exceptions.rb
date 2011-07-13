require 'json'

module Rack
  module PublishExceptions
    class << self
      def configure
        yield self
      end

      def publisher
      end

      def publisher=(value)
      end

      def format
      end

      def format=(value)
      end
    end
  end
end
