# -*- encoding: utf-8 -*-

require File.join(File.dirname(__FILE__), 'lib', 'flexunit4')
require 'rake'

Gem::Specification.new do |s|
  s.name                      = FlexUnit::NAME
  s.version                   = FlexUnit::VERSION
  s.platform                  = Gem::Platform::RUBY
  s.authors                   = ["Simon Gregory"]
  s.email                     = ["projectsprouts@googlegroups.com"]
  s.homepage                  = "http://projectsprouts.org"
  s.summary                   = "FlexUnit is a unit testing framework for Flex and ActionScript 3.0 applications and libraries."
  s.description               = "FlexUnit 4 is meta-data driven allowing you to have extreme freedom and ease when creating tests."
  s.rubyforge_project         = "sprout-flexunit"
  s.required_rubygems_version = ">= 1.3.7"
  s.require_path              = "lib"
  s.files                     = FileList["**/*"].exclude /docs|.DS_Store|generated|.svn|.git|airglobal.swc|airframework.swc/
end

