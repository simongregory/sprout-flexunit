module FlexUnit4
  class SuiteClassGenerator < FlashSDK::ClassGenerator
    include FlashSDK::FlashHelper

    def initialize
      super
      self.input = 'AllTests.as'
    end

    def manifest
      directory test do
        template input, 'FlexUnit4SuiteClass.as'
      end
    end
  end
end

