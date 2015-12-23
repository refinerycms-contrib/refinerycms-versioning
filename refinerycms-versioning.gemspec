# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-versioning'
  s.version           = '1.0.0'
  s.description       = 'Refinery CMS Versioning with PaperTrail'
  s.date              = '2015-12-18'
  s.summary           = 'Refinery CMS Versioning with PaperTrail'
  s.require_paths     = %w(lib)
  s.files             = Dir['{app,config,db,lib}/**/*'] + ['readme.md']
  s.authors           = ['Brice Sanchez']

  # Runtime dependencies
  s.add_dependency 'refinerycms-core', '~> 3.0.0'
  s.add_dependency 'refinerycms-pages', '~> 3.0.0'
  s.add_dependency 'paper_trail', '~> 4.0.0'
  s.add_dependency 'diffy', '~> 3.1.0'
  # s.add_dependency 'globalize-versioning', '~> 0.2.0'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 3.0.0'
end