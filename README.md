# Project Sprouts FlexUnit 4.x Gem _ALPHA_

This RubyGem contains templates and libraries to add support for 
[FlexUnit](http://flexunit.org) in [Project Sprouts](http://projectsprouts.org).

## Install

  git clone [this repo]
  cd sprout-flexunit
  bundle install
  gem build flexunit4.gemspec 
  gem install flexunit4-0.0.1.pre.gem
    
#### Or

  gem install flexunit --pre

## Usage

Make sure you have sprouts installed, then use:

  sprout-flex TestProject
  
To generate you project template. The following edits will need to take place,

 * Replace all `:asunit` references with `:flexunit4` in the Rake file.
 * Manually convert the TestRunner.mxml to use your choice of FlexUnit runners.
 * Switch the test task to use `amxmlc` in the Rake file.

This will mean that when you generate a class using:

  sprout-class ClassToTest
  
FlexUnit templates will be used to generate the associated test class.

## TODO

 * Use remote zip downloaded directly from the FlexUnit site.

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
