require 'flashsdk'

require 'flexunit4/generators/air_project_generator'
require 'flexunit4/generators/flex_project_generator'
require 'flexunit4/generators/project_generator'
require 'flexunit4/generators/runner_generator'
require 'flexunit4/generators/suite_class_generator'
require 'flexunit4/generators/test_class_generator'
require 'flexunit4/module'

Sprout::Specification.new do |s|
  s.name    = FlexUnit::NAME
  s.version = FlexUnit::VERSION

  s.add_remote_file_target do |t|
    t.platform     = :universal
    t.archive_type = :zip
    t.url          = FlexUnit::ZIP
    t.md5          = FlexUnit::MD5

    # Picks the full contents of the zip up and moves it to the lib... causes
    # further problems as FlexUnit docs etc are in there.
    # t.add_library :swc, ['flexunit/']

    # According to sprout doc's and examples this level of granularity should work.
    t.add_library :flexunit_as3, "flexunit/flexunit-4.1.0-8-as3_4.1.0.16076.swc"
    t.add_library :flexunit_flex, "flexunit/flexunit-4.1.0-8-flex_4.1.0.16076.swc"
    t.add_library :flexunit_aircilistener, "flexunit/flexunit-aircilistener-4.1.0-8-4.1.0.16076.swc"
    t.add_library :flexunit_cilistener, "flexunit/flexunit-cilistener-4.1.0-8-4.1.0.16076.swc"
    t.add_library :flexunit_flexcoverlistener, "flexunit/flexunit-flexcoverlistener-4.1.0-8-4.1.0.16076.swc"
    t.add_library :flexunit_uilistener, "flexunit/flexunit-uilistener-4.1.0-8-4.1.0.16076.swc"
    t.add_library :flexunit_extensions, "flexunit/fluint-extensions-4.1.0-8-4.1.0.16076.swc"
  end
end