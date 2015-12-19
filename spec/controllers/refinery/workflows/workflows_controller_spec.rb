require "spec_helper"

module Refinery
  module Workflows
    describe WorkflowsController, type: :controller do

      before do
        @route = Refinery::Workflows::Engine.routes
        Refinery::Workflows::Engine::load_seed

        @new_page = Refinery::Page.new
        allow(Refinery::Page).to receive_messages(:where => [ @new_page ])
      end

      describe "GET new" do
        it "before_filter assigns a new workflow" do
          get :new
          expect(assigns(:workflow)).to be_a_new(Workflow)
        end
        it "before_filter assigns page to workflows/new" do
          get :new
          expect(assigns(:page)).to eq @new_page
        end
      end

      describe "POST create" do

        before{
          allow_any_instance_of(Workflow).to receive(:save).and_return( true )
        }


        it "before_filter assigns page to workflows/new" do
          post :create, workflow: {email: "foo"}
          expect(assigns(:page)).to eq @new_page
        end

        it "before_filter assigns a new workflow" do
          post :create, workflow: {email: "foo"}
          expect(assigns(:workflow)).to be_a_new(Workflow)
        end

        it "redirects to thank_you" do
          post :create, workflow: {email: "foo"}
          expect(response).to redirect_to "/workflows/thank_you"
        end

        describe "when it can't save the workflow" do

          before {
          allow_any_instance_of(Workflow).to receive(:save).and_return( false )
          }

          it "redirects to new if it can't save" do
            post :create, workflow: {email: "foo"}

            expect(response).to render_template(:new)
          end
        end

      end
    end
  end
end
