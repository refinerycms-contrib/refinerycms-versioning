require 'paper_trail'

begin
  module Refinery
    PagePart.class_eval do
      has_paper_trail class_name: "Refinery::PagePartVersion"

      translates :body, versioning: :paper_trail
    end
  end
rescue NameError
end