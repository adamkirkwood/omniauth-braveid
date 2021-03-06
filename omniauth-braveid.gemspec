# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-braveid/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-braveid"
  spec.version       = Omniauth::BraveId::VERSION
  spec.authors       = ["Adam Kirkwood"]
  spec.email         = ["adam@xyentific.com"]
  spec.description   = %q{OmniAuth strategy for BraveID}
  spec.summary       = spec.description
  spec.homepage      = "http://github.com/adamkirkwood/omniauth-braveid"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'omniauth', '~> 1.0'
  spec.add_dependency 'omniauth-oauth2', '~> 1.0'
  spec.add_dependency 'multi_json'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
