module FlexUnit4
  class RunnerGenerator < FlashSDK::ClassGenerator

    def manifest
      template "#{class_name}.mxml", 'Flex4RunnerClass.mxml'
    end

  end
end