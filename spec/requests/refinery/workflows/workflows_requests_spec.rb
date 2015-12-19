require "spec_helper"

module Refinery
  module Workflows

    describe "Workflows request specs", type: :request do

      before(:each) do
        Refinery::Workflows::Engine.load_seed
      end

      it "successfully gets the index path as redirection" do
        get("/workflows")
        expect(response).to be_redirect
        expect(response).to redirect_to("/workflows/new")
      end

      it "successfully gets the new path" do
        get("/workflows/new")
        expect(response).to be_success
        expect(response).to render_template(:new)
      end

      it "successfully gets the thank_you path" do
        get("/workflows/thank_you")
        expect(response).to be_success
        expect(response).to render_template(:thank_you)
      end

    end
  end
end
