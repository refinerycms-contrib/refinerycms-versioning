require 'paper_trail'

begin
  module Refinery
    Page.class_eval do
      has_paper_trail class_name: "Refinery::PageVersion"

      translates :title, :menu_title, :custom_slug, :slug, include: :seo_meta, versioning: :paper_trail
    end
  end
rescue NameError
end