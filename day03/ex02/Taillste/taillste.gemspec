# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'taillste/version'

Gem::Specification.new do |spec|
  spec.name          = "taillste"
  spec.version       = Taillste::VERSION
  spec.authors       = ["sballet"]
  spec.email         = ["sballet@student.42.fr"]
  spec.homepage      = 'https://guides.rubygems.org/specification-reference/'

  spec.summary       = %q{Gem a but pedagogique}
  spec.license       = "MIT"


  spec.files         = './lib/taillste.rb'
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", '~> 2.2'
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
