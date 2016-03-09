# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'update_profile_pic/version'

Gem::Specification.new do |spec|
  spec.name          = UpdateProfilePic::PROJECT
  spec.version       = UpdateProfilePic::VERSION
  spec.authors       = ['dkhamsing']
  spec.email         = ['dkhamsing8@gmail.com']

  spec.summary       = 'Update your profile pic in a snap'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/dkhamsing'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = [spec.name]
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'twitter', '~> 5.15.0'
  spec.add_runtime_dependency 'twitter_oauth_token', '~> 0.1.0'
 end
