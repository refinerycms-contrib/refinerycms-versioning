module Refinery
  module Versioning
    include ActiveSupport::Configurable

    config_accessor :enable_for

    self.enable_for = []

    if defined?(Refinery::Page)
      self.enable_for << 'Refinery::Page'
    end
  end
end