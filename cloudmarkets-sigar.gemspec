# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloudmarkets/sigar/version'

Gem::Specification.new do |spec|
  spec.name          = "cloudmarkets-sigar"
  spec.version       = Cloudmarkets::Sigar::VERSION
  spec.authors       = ["Doug MacEachern", "Jörg Gottschlich"]
  spec.email         = ["sigar-users@hyperic.org","jgottschlich@cloudscale.de"]
  spec.summary       = %q{System Information Gatherer And Reporter (Custom Ruby Gem bundle)}
  spec.description   = %q{Customized gem bundle of sigar to working gem for current ruby versions (i.e. 2.0+). Also includes additional metrics such as cpu load in %.}
  spec.homepage      = "http://sigar.hyperic.com/"
  spec.license       = "Apache 2.0"

  spec.files         = 
    %w(LICENSE NOTICE README.md Rakefile) +
    %w(ext/cloudmarkets/sigar/bindings/SigarWrapper.pm ext/cloudmarkets/sigar/bindings/SigarBuild.pm) +
    `git ls-files -- ext/cloudmarkets/sigar/bindings/ruby/*`.split("\n") +
    Dir.glob("ext/cloudmarkets/sigar/include/*.h") +
    Dir.glob("ext/cloudmarkets/sigar/src/**/*.[ch]") +
    Dir.glob("ext/cloudmarkets/sigar/src/**/*.in") +
    Dir.glob("ext/cloudmarkets/sigar/version.properties") +
    Dir.glob("lib/**/*")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.extensions    = 'ext/cloudmarkets/sigar/extconf.rb'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
