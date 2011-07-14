require 'sinatra'

class DummyApp < Sinatra::Application
  get '/' do
    'ok'
  end

  post '/' do
    'post'
  end

  put '/' do
    'put'
  end

  delete '/' do
    'delete'
  end

  get '/error' do
    raise Exception, 'Application Error!'
  end
end
