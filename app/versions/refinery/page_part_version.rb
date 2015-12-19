module Refinery
  class PagePartVersion < PaperTrail::Version
    self.table_name = :refinery_page_part_versions
  end
end