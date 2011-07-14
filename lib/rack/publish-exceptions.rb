require 'json'

module Rack
  class PublishExceptions
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, body =
        begin
          @app.call(env)
        rescue Exception => error
          @@publisher.publish(@@format.call(error,env))
          raise error
        end
      [status, headers, body]
    end

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
        @@format ||= proc do |exception, env|
          {:exception => {
             :class => exception.class.to_s,
             :message => exception.message
          }}.to_json
        end
      end

      def format=(value)
        @@format = value
      end

      def reset_config!
        @@format = nil
        @@publisher = nil
      end
    end
  end
end
