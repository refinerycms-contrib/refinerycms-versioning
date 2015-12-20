Refinery::PagesController.class_eval do
  def deleted
    @documents = DocumentVersion.where(event: 'destroy')
  end
end