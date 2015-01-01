$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'webrelais'
require 'minitest/autorun'

module Webrelais
  class TestCase < MiniTest::Test
  end
end
