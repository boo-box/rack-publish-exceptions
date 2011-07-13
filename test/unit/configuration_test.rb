require 'test_helper'

describe 'Configuration' do
  before do
    @adapter = Class.new do
      def publish(message); end
    end
  end

  it "should be able to configure the publisher" do
    Rack::PublishExceptions.configure do |c|
      c.publisher = @adapter.new
    end

    assert Rack::PublishExceptions.publisher.instance_of?(@adapter)
  end

  it "should require the publisher to respond to publish" do
    assert_raises ArgumentError do
      Rack::PublishExceptions.configure do |c|
        c.publisher = nil
      end
    end
  end

  it "should be able to configure the format" do
    Rack::PublishExceptions.configure do |c|
      c.format = proc do |exception, env|
        [exception, env].to_json
      end
    end

    assert_equal(Rack::PublishExceptions.format.call(nil,nil), "[null,null]")
  end

  it "should require the format result to respond to call" do
    assert_raises ArgumentError do
      Rack::PublishExceptions.configure do |c|
        c.format = nil
      end
    end
  end
end
