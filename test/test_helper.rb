require 'bundler/setup'
Bundler.require :test

require 'minitest/spec'
require 'minitest/pride'

$:.push 'lib'
require 'rack/publish-exceptions'
