Refinery::PagesController.class_eval do
  def history
    @versions = Refinery::PageVersion.order('created_at DESC')
  end
end