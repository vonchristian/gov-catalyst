FactoryBot.define do
  factory :business do
    association :type_of_organization
    sequence(:name) { |n| "business " +  ('a'..'z').to_a.shuffle.join }
  end
end
