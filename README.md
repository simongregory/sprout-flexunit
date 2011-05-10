# Project Sprouts FlexUnit 4.x Gem _ALPHA_

This [RubyGem](http://docs.rubygems.org/read/book/7) contains templates and 
libraries to add support for [FlexUnit](http://flexunit.org) in 
[Project Sprouts](http://projectsprouts.org). In it's current state it's only
reliable function is to provide sprout-class generator support, see the TODO's
below.

## Install

    git clone [this repo]
    cd sprout-flexunit
    bundle install
    gem build flexunit.gemspec 
    gem install flexunit
    
#### Or

    gem install flexunit --pre

## Usage

Generate a project with 

    fu-as3 TestProject
    
Or edit your Gemfile to include

    gem "flexunit", ">= 0.0.3.pre"

This will mean that when you generate a class using:

    sprout-class JamJar
  
The associated FlexUnit test case will automatically be created.

To build (when the swc's link as expected) the following Rake file edits may be 
needed:

 * Replace `:asunit` references with `:flexunit4`.
 * Manually convert the TestRunner.mxml to use your choice of FlexUnit runners.
 * Switch the test task to use `amxmlc` in the Rake file (if appropriate).

## TODO
 
 * SWC library linkage
 * Project Templates for AS3, Flex, & AIR
 * Runner Templates for AS3, Flex, & AIR
 * Rake examples
 
## Credit

To Luke Bayes and Kristopher Joseph as similarity to the FlashSDK and Robotlegs
srpout gems are not purely coincidental.
 
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
