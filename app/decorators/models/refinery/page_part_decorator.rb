begin
  module Refinery
    PagePart.class_eval do
      has_paper_trail

      translates :body, versioning: :paper_trail
    end
  end
rescue NameError
end