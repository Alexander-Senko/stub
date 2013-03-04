# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stub/version'

Gem::Specification.new do |spec|
	spec.name        = 'stub'
	spec.version     = Stub::VERSION
	spec.authors     = [ 'Alexander Senko' ]
	spec.email       = [ 'Alexander.Senko@gmail.com' ]
	spec.description = 'Useful for creating stubs with partially defined objects.'
	spec.summary     = 'Proxy objects with fallbacks.'
	spec.homepage    = 'https://github.com/softpro/stub'
	spec.license     = 'MIT'

	spec.files         = `git ls-files`.split($/)
	spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
	spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
	spec.require_paths = [ 'lib' ]

	spec.add_development_dependency 'bundler', '~> 1.3'
	spec.add_development_dependency 'rake'
end
