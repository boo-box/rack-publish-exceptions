require 'json'

module Rack
  module PublishExceptions
    class << self
      def configure
        yield self
      end

      def publisher
        @@publisher
      end

      def publisher=(value)
        raise ArgumentError, 'The publisher should respond to #publish' unless value.respond_to?(:publish)
        @@publisher = value
      end

      def format
        @@format
      end

      def format=(value)
        raise ArgumentError, 'The format should respond to #call' unless value.respond_to?(:call)
        @@format = value
      end
    end
  end
end
