$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kms/shop/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kms_shop"
  s.version     = Kms::Shop::VERSION
  s.authors     = ["Igor Petrov"]
  s.email       = ["garik.piton@gmail.com"]
  s.homepage    = "http://github.com/webgradus/kms_shop"
  s.summary     = "Extends KMS Catalog by adding cart and orders feature"
  s.description = "Extends KMS Catalog by adding cart and orders feature"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"
  s.add_dependency "kms_catalog", "~> 0.4"

  s.add_development_dependency 'combustion', '~> 0.5.4'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'rspec-rails', '~> 3.5.0'
  s.add_development_dependency 'shoulda-matchers', '~> 3.1'
  s.add_development_dependency 'byebug'
end
