require 'test_helper'

class TestClassGeneratorTest < Test::Unit::TestCase
  include Sprout::TestHelper

  context "A new test class generator" do

    setup do
      @temp             = File.join(fixtures, 'generators', 'tmp')
      FileUtils.mkdir_p @temp
      @generator        = FlexUnit4::TestClassGenerator.new
      @generator.path   = @temp
      @generator.logger = StringIO.new
    end

    teardown do
      remove_file @temp
    end

    should "generate test class and add it to the test suite" do
      @generator.input = "org.BrainUtils"
      @generator.execute

      suite_dir = File.join(@temp, "test")
      assert_directory suite_dir

      suite_file = File.join(suite_dir, "AllTests.as")

      assert_file suite_file do |content|
        assert_matches /import org.BrainUtilsTest/, content
        assert_matches /public var org_BrainUtilsTest:org\.BrainUtilsTest/, content
      end

      class_dir = File.join(@temp, "test", "org")
      assert_directory class_dir

      test_file = File.join(class_dir, "BrainUtilsTest.as")

      assert_file test_file do |content|
        assert_match /org/, content
        assert_match /BrainUtilsTest/, content
        assert_match /class BrainUtilsTest/, content
        assert_match /class BrainUtilsTest/, content
        assert_match /private var .*:BrainUtils;/, content
      end

    end

  end
end
