FactoryBot.define do
  factory :business_ownership, class: "Businesses::BusinessOwnership" do
    association :owner, factory: :taxpayer
    business
  end
end
