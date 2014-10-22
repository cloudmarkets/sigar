# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloudscale/sigar/version'

Gem::Specification.new do |spec|
  spec.name          = "cloudscale-sigar"
  spec.version       = Cloudscale::Sigar::VERSION
  spec.authors       = ["Doug MacEachern", "Jörg Gottschlich"]
  spec.email         = ["sigar-users@hyperic.org","jgottschlich@cloudscale.de"]
  spec.summary       = %q{System Information Gatherer And Reporter (Custom Ruby Gem bundle)}
  spec.description   = %q{Customized gem bundle of sigar to working gem for current ruby versions (i.e. 2.0+). Also includes additional metrics such as cpu load in %.}
  spec.homepage      = "http://sigar.hyperic.com/"
  spec.license       = "Apache 2.0"

  spec.files         = 
    %w(LICENSE NOTICE README Rakefile version.properties) +
    %w(bindings/SigarWrapper.pm bindings/SigarBuild.pm) +
    `git ls-files -- bindings/ruby/*`.split("\n") +
    Dir.glob("include/*.h") +
    Dir.glob("src/**/*.[ch]") +
    Dir.glob("src/**/*.in")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.extensions    = 'ext/cloudmarkets/sigar/extconf.rb'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
