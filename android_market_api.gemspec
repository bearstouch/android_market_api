# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "android_market_api/version"

Gem::Specification.new do |s|
  s.name        = "android_market_api"
  s.version     = AndroidMarketApi::VERSION
  s.authors     = ["Hélder Vasconcelos"]
  s.email       = ["heldervasc@bearstouch.com"]
  s.homepage    = "http://rubygems.org/gems/android_market_api"
  s.summary     = %q{API for parsing Android Market and getting  some usefull information about applications}
  s.description = %q{API for parsing Android Market and getting  some usefull information about applications}

  s.rubyforge_project = "android_market_api"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_dependency "hpricot"
end
