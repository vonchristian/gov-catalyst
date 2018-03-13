FactoryBot.define do
  factory :business do
    association :type_of_organization
    association :category
    sequence(:name) { |n| "business " +  ('a'..'z').to_a.shuffle.join }
  end
end
