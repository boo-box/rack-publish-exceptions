require 'test_helper'

describe 'Exception Notification' do
  it "should generate the report correctly" do
    Rack::PublishExceptions.configure do |c|
      c.format = proc do |exception, env|
        {:exception => {
           :class => exception.class.to_s,
           :message => exception.message
        }}.to_json
      end
    end

    app = proc { raise ArgumentError }
    middleware = Rack::PublishExceptions.new(app)

    assert_raises(ArgumentError) do
      mock(Rack::PublishExceptions.publisher).publish('{"exception":{"class":"ArgumentError","message":"ArgumentError"}}') { "{}" }
      middleware.call([])
    end
  end
end
