require 'bundler/setup'
Bundler.require :test

require 'minitest/spec'
require 'minitest/pride'

class MiniTest::Unit::TestCase
  include RR::Adapters::MiniTest
end

$:.push 'lib'
require 'rack/publish-exceptions'
