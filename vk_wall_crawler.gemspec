# coding: utf-8
$: << File.expand_path('../lib', __FILE__)
require 'vk_wall_crawler/version'

Gem::Specification.new do |spec|
  spec.name          = "vk_wall_crawler"
  spec.version       = VkWallCrawler::VERSION
  spec.authors       = ["Denys"]
  spec.email         = ["denys.buzhor@prodigiagency.com"]
  spec.description   = "Simple vkontakte wall and search fetcher."
  spec.summary       = "My first gem :) "
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "vkontakte_api", "~> 1.2"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "vkontakte_api", "~> 1.2"
end
