begin
  module Refinery
    Page.class_eval do
      has_paper_trail

      translates :title, :menu_title, :custom_slug, :slug, include: :seo_meta, versioning: :paper_trail
    end
  end
rescue NameError
end