require 'test_helper'

describe 'Configuration' do
  before do
    @adapter = Class.new do
      def publish(message); end
    end

    Rack::PublishExceptions.reset_config!
  end

  it "should be able to configure the publisher" do
    Rack::PublishExceptions.configure do |c|
      c.publisher = @adapter.new
    end

    assert Rack::PublishExceptions.publisher.instance_of?(@adapter)
  end

  it "should have a default format" do
    assert_equal Rack::PublishExceptions.format.call(Exception.new('Message'),nil), '{"exception":{"class":"Exception","message":"Message"}}'
  end

  it "should be able to configure the format" do
    Rack::PublishExceptions.configure do |c|
      c.format = proc do |exception, env|
        [exception, env].to_json
      end
    end

    assert_equal(Rack::PublishExceptions.format.call(nil,nil), "[null,null]")
  end
end
