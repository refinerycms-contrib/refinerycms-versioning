require 'refinerycms-core'
require 'paper_trail'
require 'diffy'

module Refinery
  module Versioning
    require 'refinery/versioning/engine'

    class << self
      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join("spec/factories").to_s ]
      end
    end
  end
end
