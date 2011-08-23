# -*- coding: UTF-8 -*-

$:.unshift File.expand_path("../lib", __FILE__)
require "connectqq/version"

Gem::Specification.new do |s|
  s.name        = "connectqq"
  s.version     = Connectqq::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Wu Yuntao"]
  s.email       = ["wyt.brandon@gmail.com"]
  s.homepage    = "http://github.com/wuyuntao/ruby-connectqq"

  s.add_runtime_dependency      "oauth"
  s.add_runtime_dependency      "json"
  s.add_development_dependency  "bundler"
  s.add_development_dependency  "rspec"
  s.add_development_dependency  "rake"
  s.add_development_dependency  "webmock"

  s.files       = ["lib/**/*.rb"]
end
