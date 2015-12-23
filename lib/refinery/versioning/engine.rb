module Refinery
  module Versioning
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Versioning

      engine_name :refinery_versioning

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "refinery_versioning"
          plugin.hide_from_menu = true
          plugin.pathname = root
        end
      end

      config.to_prepare do
        Decorators.register! ::Refinery::Versioning.root
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Versioning)
      end
    end
  end
end
