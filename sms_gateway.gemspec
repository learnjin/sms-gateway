# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sms_gateway/version"

Gem::Specification.new do |s|
  s.name        = "sms_gateway"
  s.version     = SmsGateway::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Kai Rubarth"]
  s.email       = ["kai@doxter.de"]
  s.homepage    = ""
  s.summary     = %q{Simple and flexible interface to SMS Gateways}
  s.description = %q{Provides an interface to SMS Gateways. So far it supports smsglobal.com and smstrade.de}

  s.rubyforge_project = "sms_gateway"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('httparty')
  s.add_dependency('resque')

  s.add_development_dependency('webmock')
  s.add_development_dependency('debugger')

end


