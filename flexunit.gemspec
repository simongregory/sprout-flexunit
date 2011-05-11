# -*- encoding: utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$:.unshift lib unless $:.include?( lib )

require 'bundler'
require 'flexunit'

Gem::Specification.new do |s|
  s.name                      = FlexUnit::NAME
  s.version                   = FlexUnit::VERSION
  s.platform                  = Gem::Platform::RUBY
  s.authors                   = ["Simon Gregory"]
  s.email                     = ["projectsprouts@googlegroups.com"]
  s.homepage                  = "http://flexunit.org"
  s.summary                   = "FlexUnit is a unit testing framework for Flex and ActionScript 3.0 applications and libraries."
  s.description               = "Project Sprouts support for the FlexUnit unit testing framework."
  s.executables               = ["fu-flex", "fu-as3", "fu-runner"]
  s.post_install_message      = File.read 'POSTINSTALL.rdoc'
  s.rubyforge_project         = "flexunit"
  s.required_rubygems_version = ">= 1.3.7"
  s.files                     = FileList["**/*"].exclude /docs|.DS_Store|generated|.svn|.git|airglobal.swc|airframework.swc/
  s.require_path              << 'lib'
  s.add_bundler_dependencies
end

