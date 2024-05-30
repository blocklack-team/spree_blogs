module SpreeBlogs
  class Engine < Rails::Engine
    require "spree/core"
    isolate_namespace Spree
    engine_name "spree_blogs"

    initializer "spree_blogs.environment", before: :load_config_initializers do |_app|
      SpreeBlogs::Config = Spree::Configuration.new
    end

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")).sort.each do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
