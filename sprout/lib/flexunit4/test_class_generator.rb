
module FlexUnit4
  class TestClassGenerator < FlashSDK::ClassGenerator

    def manifest
      directory test_class_directory do
        template "#{test_class_name}.as", 'FlexUnit4TestClass.as'
      end

      generator :suite_class, {:input => 'AllTests.as'}
    end

  end
end

