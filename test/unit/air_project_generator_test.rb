require 'test_helper'

class AIRProjectGeneratorTest < Test::Unit::TestCase
  include Sprout::TestHelper

  context "A new AIR project generator" do

    setup do
      @temp             = File.join(fixtures, 'generators', 'tmp')
      FileUtils.mkdir_p @temp
      @generator        = FlexUnit4::AIRProjectGenerator.new
      @generator.path   = @temp
      @generator.logger = StringIO.new
    end

    teardown do
      remove_file @temp
    end

    should "generate a new AIR application" do
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
        assert_matches /<s:WindowedApplication/, content
        assert_matches '<s:Label text="SomeProject"', content
      end
      assert_file File.join(project, 'src', 'SomeProject-app.xml') do |content|
        assert_matches '<application xmlns="http://ns.adobe.com/air/application/1.5.3">', content
      end
      assert_file File.join(project, 'src', 'SomeProjectRunner.mxml') do |content|
        assert_matches /org.flexunit.runner.FlexUnitCore\b/, content
      end
      assert_file File.join(project, 'src', 'SomeProjectRunner-app.xml') do |content|
        assert_matches 'xmlns="http://ns.adobe.com/air/application/2.5"', content
      end      
      assert_directory File.join(project, 'cert')
      assert_file File.join(project, 'cert', 'password')
      assert_file File.join(project, 'cert', 'dev-cert.p12')
      
      assert_directory File.join(project, 'lib')
      assert_directory File.join(project, 'bin')
    end
  end
end