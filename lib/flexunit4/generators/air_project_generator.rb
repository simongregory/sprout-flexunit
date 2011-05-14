module FlexUnit4
  class AIRProjectGenerator < FlashSDK::FlexProjectGenerator

    def manifest
      directory input do
        template 'Rakefile', 'AIRRakefile.rb'
        template 'Gemfile'

        directory src do
          template "#{input.camel_case}.mxml", 'AIRApplication.mxml'
          template "#{test_runner_name}.mxml", 'AIRRunner.mxml'
          template "#{input.camel_case}-app.xml", 'AIRApplication-app.xml'

          directory assets do
            directory css do
              file 'Main.css', 'Flex4Main.css'
            end
            directory images
            directory fonts
          end

        end

        # Create empty directories:
        directory lib
        directory bin
      end

    end
  end
end
