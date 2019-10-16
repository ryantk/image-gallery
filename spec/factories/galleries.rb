FactoryBot.define do
  factory :gallery do
    sequence(:title) {|i| "Gallery #{i}" }
  end
end