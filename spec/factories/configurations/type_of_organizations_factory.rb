FactoryBot.define do
  factory :type_of_organization, class: "Configurations::TypeOfOrganization" do
    sequence(:name) { |n| "Type of organization" +  ('a'..'z').to_a.shuffle.join }
  end
end
