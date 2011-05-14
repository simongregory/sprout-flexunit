require 'test_helper'

class TestClassGeneratorTest < Test::Unit::TestCase
  include Sprout::TestHelper

  context "A new test class generator" do

    setup do
      @temp             = File.join(fixtures, 'generators', 'tmp')
      FileUtils.mkdir_p @temp
      @generator        = FlexUnit4::RunnerGenerator.new
      @generator.path   = @temp
      @generator.logger = StringIO.new
    end

    teardown do
      remove_file @temp
    end

    should "generate test runner" do
      @generator.input = "FastFeet"
      @generator.execute

      runner_file = File.join(@temp, "FastFeet.mxml")

      assert_file runner_file do |content|
        assert_matches /private var core:FlexUnitCore\b/, content
        assert_matches /core\.run\(AllTests\)/, content
      end
    end

  end
end
