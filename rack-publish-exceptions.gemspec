# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "rack-publish-exceptions"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["boo-box"]
  s.email       = ["cainan.costa@boo-box.com"]
  s.homepage    = "http://github.com/boo-box/rack-publish-exceptions"
  s.summary     = "A Rack Middleware to process exceptions."
  s.description = "A Rack Middleware to process exceptions."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('rake')
  s.add_development_dependency('bundler')
end
