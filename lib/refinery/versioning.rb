require 'refinerycms-core'
require 'refinerycms-pages'
require 'paper_trail'
require 'globalize-versioning'
require 'diffy'

module Refinery
  module Versioning
    require 'refinery/versioning/configuration'

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

require 'refinery/versioning/engine'