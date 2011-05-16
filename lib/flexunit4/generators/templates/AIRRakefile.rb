require 'rubygems'
require 'bundler'
Bundler.require

##############################
# Debug

# Compile the debug swf
amxmlc "<%= bin %>/<%= debug_swf_name %>" do |t|
  t.input = "<%= src %>/<%= class_name %>.mxml"
  t.debug = true
end

# Run the debug swf using adl
adl "<%= bin %>/<%= debug_swf_name %>" do |t|
  app_desc = "<%= src %>/<%= class_name %>-app.xml"
end

task :debug => "<%= bin %>/<%= debug_swf_name %>"

##############################
# Test

library :flexunit, :flexunit_flex
library :flexunit, :flexunit_aircilistener

# Compile the test swf
amxmlc "<%= bin %>/<%= test_swf_name %>" do |t|
  t.input = "<%= src %>/<%= test_runner_name %>.mxml"
  t.library_path << "lib/flexunit/"
  t.source_path << "test"
  t.debug = true
end

desc "Compile and run the test swf"
flashplayer :test => "<%= bin %>/<%= test_swf_name %>"

##############################
# Package

desc "Create AIR installer"

adt 'bin/<%= class_name %>.air' => 'bin/<%= class_name %>.swf' do |t|
  t.package        = true
  t.package_input  = '<%= class_name %>-app.xml'
  t.package_output = 'bin/<%= class_name %>.air'
  t.storetype      = 'PKCS12'
  t.keystore       = 'cert/dev-cert.p12'
  t.storepass      = File.read('cert/password')
  t.included_files << 'bin/<%= class_name %>.swf'
end

desc "Compile, certify and package the AIR application"
task :package => 'bin/<%= class_name %>.air'

##############################
# ASDoc

desc "Generate documentation at <%= doc %>/"
asdoc '<%= doc %>' do |t|
  t.doc_sources << "<%= src %>"
  t.exclude_sources << "<%= src %>/<%= test_runner_name %>.as"
end

task :default => :debug

