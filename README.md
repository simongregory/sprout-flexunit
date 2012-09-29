# Project Sprouts FlexUnit 4.x Gem _ALPHA_

[![Build Status](https://secure.travis-ci.org/simongregory/sprout-flexunit.png)](http://travis-ci.org/simongregory/sprout-flexunit)

This [RubyGem](http://docs.rubygems.org/read/book/7) contains templates and
libraries to add support for [FlexUnit](http://flexunit.org) in
[Project Sprouts](http://projectsprouts.org). Functionality includes the ability
to create ActionScript 3, Flex, and AIR projects that are integrated with the
Sprouts workflow

## Install

    git clone [this repo]
    cd sprout-flexunit
    bundle install
    gem build flexunit.gemspec
    gem install flexunit

#### Or

    gem install flexunit --pre

jruby users will have to install manually until issue #1 is resolved.

## Usage

Generate a project with

    fu-as3 TestProject

Or edit your Gemfile to include

    gem "flexunit", ">= 0.0.9.pre"

This will mean that when you generate a class using:

    sprout-class JamJar

The associated FlexUnit test case will automatically be created.

To build the following Rake file edits may be needed:

 * Manually convert the TestRunner.mxml to use your choice of FlexUnit runners.
 * Switch the test task to use `amxmlc` in the Rake file (if appropriate).

## Credit

To [Luke Bayes](http://github.com/lukebayes/) and [Kristopher Joseph](http://github.com/kristoferjoseph/) as similarity to the [FlashSDK](https://github.com/lukebayes/sprout-flashsdk) and [Robotlegs](http://github.com/kristoferjoseph/sprout-robotlegs)
sprout gems are _not_ purely coincidental.
 
## MIT License

Copyright (c) 2011 Simon Gregory

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
