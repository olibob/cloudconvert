# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloudconvert/version'

Gem::Specification.new do |spec|
  spec.name          = "cloudconvert"
  spec.version       = Cloudconvert::VERSION
  spec.authors       = ["Pandurang Waghulde"]
  spec.email         = ["pandurang.plw@gmail.com"]
  spec.description   = "Ruby wrapper for CloudConvert"
  spec.summary       = "Ruby wrapper for CloudConvert"
  spec.homepage      = "https://github.com/pandurang90/cloudconvert"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "faraday", '~> 0.9.0'
  spec.add_dependency 'faraday_middleware', '~> 0.9.1'
  spec.add_dependency "json"
end
