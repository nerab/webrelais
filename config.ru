require 'bundler'
Bundler.require

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'webrelais'

run Rack::URLMap.new('/' => Webrelais::WebApp)
