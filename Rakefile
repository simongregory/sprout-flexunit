require 'rubygems'
require 'bundler'

Bundler.require

require 'rake'
require 'rake/clean'
require 'rake/testtask'

require File.join(File.dirname(__FILE__), 'sprout', 'lib', 'flexunit4')

Rake::TestTask.new(:test) do |t|
  t.libs << "sprout/test/unit"
  t.test_files = FileList["sprout/test/unit/*_test.rb"]
  t.verbose = true
end

CLEAN.add '*.gem'

task :default => :test
