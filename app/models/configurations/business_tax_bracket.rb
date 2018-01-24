module Configurations
  class BusinessTaxBracket < ApplicationRecord
    enum tax_type: [:fixed_amount, :percentage, :percentage_with_tax_on_excess]
    def self.set_tax(gross_sale)
      tax = gross_sale.tax_brackets.select{|a| a.amount_range.include?(gross_sale.amount)}.first
      if tax.fixed_amount?
        tax_for_fixed_amount(gross_sale, tax)
      elsif tax.percentage?
        tax_for_percentage(gross_sale, tax)
      elsif tax.percentage_with_tax_on_excess?
        tax_for_percentage_with_excess(gross_sale, tax)
      end
    end
    private
    def tax_for_fixed_amount(gross_sale, tax)
      tax.tax_amount
    end
    def tax_for_percentage(gross_sale, tax)
      tax.tax_rate * gross_sale.amount
    end
    def tax_for_percentage_with_excess(gross_sale, tax)
      tax_for_percentage(gross_sale, tax) + tax_for_excess(gross_sale, tax)
    end
    def tax_for_excess(gross_sale, tax)
      excess = gross_sale.amount - tax.max_limit
      excess * tax_rate_for_excess
    end
  end
end
