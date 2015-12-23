  module Refinery
  module Admin
    class VersionsController < Refinery::AdminController
      before_action :set_document_and_version, only: [:diff, :rollback, :destroy]

      def rollback
        # change the current page to the specified version
        # reify gives you the object of this version
        page = @version.reify
        page.save
        redirect_to refinery.admin_edit_page_path(page)
      end

      def bringback
        version = PageVersion.friendly.find(params[:id])
        @page = version.reify
        @page.save
        # Let's remove the version since the document is undeleted
        version.delete
        redirect_to root_path, notice: 'The page was successfully brought back!'
      end

      private

      def set_document_and_version
        @page = Page.friendly.with_globalize.includes(:versions).find(params[:page_id])
        @version = @page.versions.find(params[:id])
      end
    end
  end
end