# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'webrelais/version'

Gem::Specification.new do |spec|
  spec.name          = "webrelais"
  spec.version       = Webrelais::VERSION
  spec.authors       = ["Nicholas E. Rabenau"]
  spec.email         = ["nerab@gmx.at"]
  spec.summary       = %q{Web interface for a Raspi relais card}
  spec.description   = %q{Web interface for a controlling a HL-58S relais card via a Raspberry Pi}
  spec.homepage      = "https://github.com/nerab/webrelais"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'sinatra'
  spec.add_dependency 'foreman'
  spec.add_dependency 'unicorn'
  spec.add_dependency 'sinatra-flash'
  spec.add_dependency 'sinatra-partial'

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rerun'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-bundler'
  spec.add_development_dependency 'guard-rack'
  spec.add_development_dependency 'guard-minitest'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-stack_explorer'
  spec.add_development_dependency 'rb-inotify'
  spec.add_development_dependency 'rb-fsevent'
  spec.add_development_dependency 'rb-readline'
end
