module Kms
  module Shop
    class Engine < ::Rails::Engine
      isolate_namespace Kms::Shop

      config.generators do |g|
        g.test_framework :rspec
        g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      end
    end
  end
end
