FactoryBot.define do
  factory :gallery do
    sequence(:title) {|i| "Gallery #{i}" }
    user
  end
end