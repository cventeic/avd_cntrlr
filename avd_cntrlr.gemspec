# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'avd_cntrlr/version'

Gem::Specification.new do |spec|
  spec.name          = "avd_cntrlr"
  spec.version       = AvdCntrlr::VERSION
  spec.authors       = ["cventeic"]
  spec.email         = ["chris@venteicher.org"]
  spec.summary       = %q{ Ruby code to dynamically update android virtual device instance from gpsd }
  spec.description   = %q{
Socket connections are opened to both GPSD and ADB for AVD.
GPSD is configured to send periodic location fixes in json formatted messages.
GPS location is updated via ADB connection when fixes are received from GPSD.
  }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'cool.io'
  spec.add_development_dependency 'yajl'
  spec.add_development_dependency 'net-telnet'
end
