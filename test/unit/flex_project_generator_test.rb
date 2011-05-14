require 'test_helper'

class FlexProjectGeneratorTest < Test::Unit::TestCase
  include Sprout::TestHelper

  context "A new flex project generator" do

    setup do
      @temp             = File.join(fixtures, 'generators', 'tmp')
      FileUtils.mkdir_p @temp
      @generator        = FlexUnit4::FlexProjectGenerator.new
      @generator.path   = @temp
      @generator.logger = StringIO.new
    end

    teardown do
      remove_file @temp
    end

    should "generate a new flex application" do
      @generator.input = 'SomeProject'
      @generator.execute
      project = File.join(@temp, 'SomeProject')
      assert_directory project
      assert_file File.join(project, 'Gemfile') do |content|
        assert_matches /flexunit/, content
      end
      assert_file File.join(project, 'Rakefile') do |content|
        assert_matches /bin\/SomeProject-debug.swf\b/, content
        assert_matches /src\/SomeProject.mxml/, content
      end
      assert_file File.join(project, 'src', 'SomeProject.mxml') do |content|
        assert_matches /<s:Application xmlns:fx=/, content
      end
      assert_file File.join(project, 'src', 'SomeProjectRunner.mxml') do |content|
        assert_matches /org.flexunit.runner.FlexUnitCore\b/, content
      end
      assert_directory File.join(project, 'lib')
      assert_directory File.join(project, 'bin')
    end

    should "accept alternate bin dir" do
      @generator.bin = 'other'
      @generator.input = 'OtherProject'
      @generator.execute
      project = File.join(@temp, 'OtherProject')
      assert_directory project
      assert_directory File.join(project, 'other')
      assert_file File.join(project, 'Rakefile') do |content|
        assert_matches /other\/OtherProject-debug.swf/, content
      end
    end
  end
end