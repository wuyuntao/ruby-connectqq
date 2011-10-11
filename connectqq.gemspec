# -*- coding: UTF-8 -*-

$LOAD_PATH.unshift 'lib'
require "connectqq/version"

Gem::Specification.new do |s|
  s.name              = "connectqq"
  s.version           = Connectqq::VERSION
  s.platform          = Gem::Platform::RUBY
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "Ruby SDK for QQ Connect API"
  s.homepage          = "http://github.com/wuyuntao/ruby-connectqq"
  s.email             = "wyt.brandon@gmail.com"
  s.authors           = [ "Wu Yuntao" ]
  s.has_rdoc          = false

  s.add_runtime_dependency      "oauth"
  s.add_runtime_dependency      "json"
  s.add_development_dependency  "bundler"
  s.add_development_dependency  "rspec"
  s.add_development_dependency  "rake"
  s.add_development_dependency  "webmock"

  s.files             = %w( README.rst Rakefile LICENSE Gemfile Gemfile.lock )
  s.files            += Dir.glob("lib/**/*")
  s.files            += Dir.glob("spec/**/*")

end
