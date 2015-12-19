# encoding: utf-8
require "spec_helper"

module Refinery
  module Workflows
    module Admin
      describe Workflow, type: :feature do
        refinery_login_with :refinery_user

       describe "workflows list" do
          before do
            FactoryGirl.create(:workflow, :email => "UniqueTitleOne")
            FactoryGirl.create(:workflow, :email => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.workflows_admin_workflows_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

       describe "show" do
         let!(:workflow) do
            FactoryGirl.create(:workflow, :email => "UniqueTitleOne")
          end

         it "has expected text and menu" do
           visit refinery.workflows_admin_workflows_path

           click_link "Read the workflow"

           expect(page).to have_content("UniqueTitleOne")
           expect(page).not_to have_content("UniqueTitleTwo")

           within "#actions" do
             expect(page).to have_content("Age")
             expect(page).to have_content("Back to all workflows")
             expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/workflows']")
             expect(page).to have_content("Remove this workflow forever")
             expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/workflows/#{workflow.id}']")
           end
         end
       end

       describe "when no " do
         before { Refinery::Workflows::Workflow.destroy_all }

         context "workflows" do
           it "shows expected message" do
            visit refinery.workflows_admin_workflows_path

            expect(page).to have_content("You have not received any workflows yet.")

            end
           end

     end

      describe "action links" do
        before { visit refinery.workflows_admin_workflows_path }

        specify "in the side pane" do
          within "#actions" do
            expect(page).to have_content("Inbox")
            expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/workflows']")

            expect(page).to have_content("Update who gets notified")
            expect(page).to have_selector("a[href*='/#{Refinery::Core.backend_route}/workflows/settings/workflow_notification_recipients/edit']")
            expect(page).to have_content("Edit confirmation email")
            expect(page).to have_selector("a[href*='/#{Refinery::Core.backend_route}/workflows/settings/workflow_confirmation_message/edit']")
          end
        end
      end



        describe "destroy" do
          before { FactoryGirl.create(:workflow, :email => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.workflows_admin_workflows_path

            click_link "Remove this workflow forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Workflows::Workflow.count).to eq 0
          end
        end

          describe "destroy from workflow show page" do
          before { FactoryGirl.create(:workflow, :email => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.workflows_admin_workflow_path( :id => '1')

            click_link "Remove this workflow forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Workflows::Workflow.count).to eq 0
          end
          end

      end
    end
  end
end
