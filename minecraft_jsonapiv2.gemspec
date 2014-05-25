# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minecraft_jsonapiv2/version'

Gem::Specification.new do |spec|
  spec.name          = "minecraft_jsonapiv2"
  spec.version       = Minecraft::JSONAPIv2::VERSION
  spec.authors       = ["Patrick Neff"]
  spec.email         = ["odie86@gmail.com"]
  spec.summary       = %q{Minecraft JSONAPI Wrapper}
  spec.description   = %q{Simple Minecraft JSONAPI Wrapper}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", ">= 10.0.0"

  spec.add_dependency "json", "~> 1.8.0"
  spec.add_dependency "httparty", "~> 0.13.0"
  spec.add_dependency "mash", "~> 0.1.0"
end
