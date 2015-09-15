FactoryGirl.define do
  factory :vote do
    association :poll
    token nil
    value nil
    comment nil
  end
end
