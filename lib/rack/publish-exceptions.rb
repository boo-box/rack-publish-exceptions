require 'json'

module Rack
  class PublishExceptions
    class << self
      def configure
        yield self
      end

      def publisher
        @@publisher
      end

      def publisher=(value)
        @@publisher = value
      end

      def format
        @@format
      end

      def format=(value)
        @@format = value
      end
    end
  end
end
