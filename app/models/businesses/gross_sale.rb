module Businesses
  class GrossSale < ApplicationRecord
    belongs_to :business

    delegate :category, to: :business
    delegate :tax_brackets, to: :category

    after_save :create_tax
    private

    def set_tax_amount
      amount = BusinessTaxBracket.set_tax(self)
      tax = Tax.create(amount: amount, name: "Business Tax", revenue_account: Accounting::Account.find_by_name("Business Tax"))
      business.tax_selections.create(tax: :tax)
    end
  end
end
