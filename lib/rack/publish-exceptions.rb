require 'json'

module Rack
  module PublishExceptions
    def self.configure
      yield self
    end

    def self.publisher
    end

    def self.publisher=
    end
  end
end
