# -*- encoding: utf-8 -*-
require File.expand_path('../lib/page_wrapper/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors               = ["Mathieu Lajugie"]
  gem.email                 = ['mathieul@gmail.com']
  gem.description           = %q{Pagination tools when using Ember, Ember Data and Rails / Rails-Api.}
  gem.summary               = gem.description
  gem.homepage              = 'https://github.com/mathieul/page_wrapper'

  gem.files                 = `git ls-files`.split($\)
  gem.executables           = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files            = gem.files.grep(%r{^(test|spec|features)/})
  gem.name                  = 'page_wrapper'
  gem.require_paths         = ['lib']
  gem.version               = PageWrapper::VERSION
  gem.required_ruby_version = '>= 1.9.2'

  gem.add_dependency "ember-rails", ["~> 0.6.0"]

  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'minitest-reporters'
  gem.add_development_dependency 'guard-minitest'
  gem.add_development_dependency 'awesome_print'
  gem.add_development_dependency 'pry-nav'
end
