require 'rubygems'
require 'bundler'

Bundler.require

require 'rake'
require 'rake/clean'
require 'rake/testtask'

require File.join(File.dirname(__FILE__), 'lib', 'flexunit4')

Rake::TestTask.new(:test) do |t|
  t.libs << "test/unit"
  t.test_files = FileList["test/unit/*_test.rb"]
  t.verbose = true
end

CLEAN.add '*.gem'

task :default => :test