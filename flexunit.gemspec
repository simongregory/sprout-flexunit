# -*- encoding: utf-8 -*-
lib = File.expand_path File.dirname(__FILE__), 'lib'
$:.unshift lib unless $:.include?(lib)

require 'bundler'
require 'flexunit'

Gem::Specification.new do |s|
  s.name                      = FlexUnit::NAME
  s.version                   = FlexUnit::VERSION
  s.authors                   = ["Simon Gregory"]
  s.email                     = ["projectsprouts@googlegroups.com"]
  s.homepage                  = "http://flexunit.org"
  s.summary                   = "FlexUnit is a unit testing framework for Flex and ActionScript 3.0 applications and libraries."
  s.description               = "Project Sprouts support for the FlexUnit unit testing framework."
  s.executables               = ["fu-flex", "fu-as3", "fu-air", "fu-runner"]
  s.post_install_message      = File.read 'POSTINSTALL.rdoc'
  s.required_rubygems_version = ">= 1.3.7"
  s.files                     = FileList["**/*"].exclude /.DS_Store|.svn|.git|.tmproj|tmp|.gem/
  s.add_bundler_dependencies
  s.require_paths              << 'lib'
end

