module Refinery
  class PageVersion < PaperTrail::Version
    self.table_name = :refinery_page_versions
  end
end