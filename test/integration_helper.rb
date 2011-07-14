require 'test_helper'

$:.push File.join(File.dirname(__FILE__), 'support')
require 'dummy_app'

include Rack::Test::Methods

def app
  Rack::Builder.new do
    use Rack::PublishExceptions
    run DummyApp
  end
end
