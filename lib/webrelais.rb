require 'webrelais/version'
require 'webrelais/pin'
require 'webrelais/board'
require 'webrelais/web_app'

module Webrelais
  def self.gpio=(program)
    @gpio = program
  end

  def self.gpio
    @gpio ||= 'gpio'
  end
end
