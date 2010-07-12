require 'rake'
require 'rspec/core/rake_task'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "language_switcher"
    gem.summary = %Q{A gem to easily handling switching between I18n locales}
    gem.description = %Q{This gem adds a few methods to switch between locales,
    and a helper to be used with jquery tabs or some other js tabbing behavior,
    to be able to change locales within a view for Rails}
    gem.email = "stefano.diem@gmail.com"
    gem.homepage = "http://github.com/teonimesic/language_switcher"
    gem.authors = ["Stefano Diem Benatti"]
    gem.add_development_dependency "rspec-core", ">= 2.0.0.beta.13"
    gem.add_dependency 'activerecord' '>= 3.0.0.beta4'
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

RSpec::Core::RakeTask.new(:spec)
task :default => :spec

