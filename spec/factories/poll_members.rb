FactoryGirl.define do
  factory :poll_member do
    association :poll
    association :user
  end
end
