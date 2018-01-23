FactoryBot.define do
  factory :business_tax_bracket do
    minimum_gross_sale "9.99"
    maximum_gross_sale "9.99"
    tax_amount "9.99"
    tax_type 1
    percent "9.99"
  end
end
