module Kms
  module Shop
    class Engine < ::Rails::Engine
      engine_name 'kms_shop'
      isolate_namespace Kms::Shop
      config.autoload_paths += Dir["#{config.root}/lib/**/"]
      config.to_prepare do
        Dir.glob(File.join(File.dirname(__FILE__), "../../../app/**/*_decorator*.rb")) do |c|
          require_dependency(c)
        end
      end

      config.generators do |g|
        g.test_framework :rspec
        g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      end
    end
  end
end
