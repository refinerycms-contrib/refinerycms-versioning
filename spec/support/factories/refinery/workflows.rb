
FactoryGirl.define do
  factory :workflow, :class => Refinery::Workflows::Workflow do
    sequence(:email) { |n| "refinery#{n}" }
  end
end

