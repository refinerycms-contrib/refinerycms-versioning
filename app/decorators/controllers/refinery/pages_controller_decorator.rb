Refinery::PagesController.class_eval do
  def deleted
    @documents = PageVersion.where(event: 'destroy')
  end
end