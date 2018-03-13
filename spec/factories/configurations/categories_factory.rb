FactoryBot.define do
  factory :category, class: "Configurations::Category" do
    sequence(:name) { |n| "Category#{n}#{SecureRandom.uuid}"}
  end
end
