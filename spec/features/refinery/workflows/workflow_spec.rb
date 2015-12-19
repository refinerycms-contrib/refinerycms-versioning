# encoding: utf-8
require "spec_helper"

module Refinery
  module Workflows
    describe "workflows", type: :feature do

      before(:each) do
        Refinery::Workflows::Engine::load_seed
      end

      describe "Create workflow" do

        before do
          visit refinery.new_workflows_workflow_path
        end

        it "should create a new item" do
          fill_in "workflow_email", :with => "Test"

          click_button ::I18n.t('.refinery.workflows.workflows.new.send')

          expect(page).to have_content("Thank You")
          expect(Refinery::Workflows::Workflow.count).to eq(1)
        end
      end
    end
  end
end

