class DummyApp
  def self.call(env)
    if env['REQUEST_METHOD'] == 'GET'
      case env['PATH_INFO']
      when '/'
        [200, {'Content-Type' => 'text/plain'}, 'ok']
      when '/error'
        raise Exception, 'Application Error!'
      end
    else
      [200, {'Content-Type' => 'text/plain'}, env['REQUEST_METHOD'].downcase]
    end
  end
end
