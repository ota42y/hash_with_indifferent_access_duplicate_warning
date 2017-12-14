
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hash_with_indifferent_access_duplicate_warning/version'

Gem::Specification.new do |spec|
  spec.name          = 'hash_with_indifferent_access_duplicate_warning'
  spec.version       = HashWithIndifferentAccessDuplicateWarning::VERSION
  spec.authors       = ['ota42y']
  spec.email         = ['ota42y@gmail.com']

  spec.summary       = 'warning duplicate hash key for HashWithIndifferentAccess'
  spec.description   = 'warning duplicate hash key for HashWithIndifferentAccess'
  spec.homepage      = 'https://github.com/ota42y/hash_with_indifferent_access_duplicate_warning'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '>= 5.0'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
