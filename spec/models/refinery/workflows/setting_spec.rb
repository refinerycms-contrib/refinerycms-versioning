require 'spec_helper'

module Refinery
  module Workflows
    describe Setting, :type => :model do
      describe ".confirmation_message=" do
        it "delegates to Refinery::Setting#set" do
          expect(Refinery::Setting).to receive(:set).
            with(:workflow_confirmation_message, "some value")

          Refinery::Workflows::Setting.confirmation_message = "some value"
        end
      end

      describe ".confirmation_subject=" do
        it "delegates to Refinery::Setting#set" do
          expect(Refinery::Setting).to receive(:set).
            with(:workflow_confirmation_subject, "some value")

          Refinery::Workflows::Setting.confirmation_subject = "some value"
        end
      end

      describe ".notification_recipients=" do
        it "delegates to Refinery::Setting#set" do
          expect(Refinery::Setting).to receive(:set).
            with(:workflow_notification_recipients, "some value")

          Refinery::Workflows::Setting.notification_recipients = "some value"
        end
      end
    end
  end
end
