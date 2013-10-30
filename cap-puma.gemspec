# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "cap-puma"
  spec.version       = '0.0.4'
  spec.authors       = ["John D'Agostino"]
  spec.email         = ["john.dagostino@gmail.com"]
  spec.description   = %q{Capistrano v3 Rake tasks for Puma}
  spec.summary       = %q{Capistrano v3 Rake tasks for Puma}
  spec.homepage      = "http://github.com/johndagostino/cap-puma"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "capistrano", "~> 3.0"
  spec.add_development_dependency "rake"
end
