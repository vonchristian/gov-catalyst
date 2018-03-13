module Configurations
  class BusinessTaxBracket < ApplicationRecord
    belongs_to :category, class_name: "Configurations::Category"
    enum tax_type: [:fixed_amount, :percentage, :percentage_with_tax_on_excess]

    def range
      minimum_gross_sale..maximum_gross_sale
    end
  end
end
