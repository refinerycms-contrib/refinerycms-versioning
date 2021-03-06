module Refinery
  class VersioningGenerator < Rails::Generators::Base

    def rake_db
      # generate "paper_trail:install"
      rake "refinery_versioning:install:migrations"
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

Refinery::Versioning::Engine.load_seed
        EOH
      end
    end

  end
end
