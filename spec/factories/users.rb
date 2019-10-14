require 'securerandom'

FactoryBot.define do
  factory :user do
    email { "user-#{SecureRandom.uuid}@example.com" }
    password { 'ValidPassword' }
    password_confirmation { 'ValidPassword' }

    trait :invalid_email do
      email { 'onlydomain.com' }
    end

    trait :missing_password do
      password {}
      password_confirmation {}
    end
  end
end