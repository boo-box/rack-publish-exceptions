require 'integration_helper'

describe 'Middleware' do
  describe 'if the app raises no error' do
    it "should do nothing if the app raises no error" do
      get '/'
      assert_equal last_response.body, 'ok'
    end

    it "should do nothing on requests other than get if the app raises no error" do
      post '/'
      assert_equal last_response.body, 'post'

      put '/'
      assert_equal last_response.body, 'put'

      delete '/'
      assert_equal last_response.body, 'delete'
    end
  end

  it "should publish the error if the app raises it" do
    assert_raises(Exception) do
      mock(Rack::PublishExceptions.publisher).publish("{\"exception\":{\"class\":\"Exception\",\"message\":\"Application Error!\"}}") { "{}" }

      get '/error'
    end
  end
end
