require "rubygems"
require "bundler"

Bundler.setup :default, :development

require 'sprout'
# These require statments *must* be in this order:
# http://bit.ly/bCC0Ew
# Somewhat surprised they're not being required by Bundler...
require 'shoulda'
require 'mocha'

$:.unshift File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib'))
$:.unshift File.expand_path(File.join(File.dirname(__FILE__), '..'))

require 'flexunit'
require 'flashsdk'
require 'sprout/test_helper'

ENV['SPROUT_GENERATORS'] = nil unless ENV['SPROUT_GENERATORS'].nil?
