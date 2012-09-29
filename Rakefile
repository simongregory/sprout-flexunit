lib = File.expand_path('lib', File.dirname(__FILE__))
$:.unshift lib unless $:.include?(lib)

require 'rubygems'
require 'rake'
require 'rake/clean'
require 'rake/testtask'
require 'flexunit'

#############################################################################
#
# Standard tasks
#
#############################################################################

Rake::TestTask.new(:test) do |t|
  t.libs << "test/unit"
  t.test_files = FileList["test/unit/*_test.rb"]
  t.verbose = true
end

CLEAN.add '*.gem'

#############################################################################
#
# Packaging tasks
#
#############################################################################

task :release do
  puts ""
  print "Are you sure you want to relase FlexUnit #{FlexUnit::VERSION}? [y/N] "
  exit unless STDIN.gets.index(/y/i) == 0

  unless `git branch` =~ /^\* master$/
    puts "You must be on the master branch to release!"
    exit!
  end

  # Build gem and upload
  sh "gem build flexunit.gemspec"
  sh "gem push flexunit-#{FlexUnit::VERSION}.gem"
  sh "rm flexunit-#{FlexUnit::VERSION}.gem"

  # Commit
  sh "git commit --allow-empty -a -m 'v#{FlexUnit::VERSION}'"
  sh "git tag v#{FlexUnit::VERSION}"
  sh "git push origin master"
  sh "git push origin v#{FlexUnit::VERSION}"
end
