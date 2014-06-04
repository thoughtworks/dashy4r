# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "dashy4r"
  gem.homepage = "http://github.com/thoughtworks/dashy4r"
  gem.license = "MIT"
  gem.summary = "dashy4r is a gem that helps you use ruby to integrate with [Dashy](https://github.com/thoughtworks/dashy)"
  gem.description = "Intercept endpoint calls to notify a Dash server about endpoint status"
  gem.email = "aduarte@thoughtworks.com"
  gem.authors = ["ThoughtWorks"]
  gem.required_ruby_version = '~> 1.8.7'
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "dashy4r #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
