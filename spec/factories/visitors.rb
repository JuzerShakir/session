FactoryBot.define do
  factory :visitor do
    sequence(:email, 1) { |n| "test#{n}@session.com" }
    password {"123456"}
    password_confirmation {"123456"}
  end
end
