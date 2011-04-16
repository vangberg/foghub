$:.unshift File.expand_path(File.dirname(__FILE__ + '../lib'))
require 'foghub/foghub'
require 'foghub/parser'

require 'rubygems'
gem 'minitest' # ensures you're using the gem, and not the built in MT
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'
require 'rack/test'
require 'mocha'

ENV['RACK_ENV'] = 'test'

class MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def self.test(description, &block)
    define_method("test_" + description.split.join('_').gsub(/\W/, ''), block)
  end
end
