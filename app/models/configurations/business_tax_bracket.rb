module Configurations
  class BusinessTaxBracket < ApplicationRecord
    enum tax_type: [:fixed_amount, :percentage, :percentage_with_tax_on_excess]

    def self.set_tax(gross_sale)
      business_tax = gross_sale.tax_brackets.
      select{ |a| a.amount_range.include?(gross_sale.amount) }.first
      if business_tax.fixed_amount?
        tax_for_fixed_amount(gross_sale, business_tax)
      elsif business_tax.percentage?
        tax_for_percentage(gross_sale, business_tax)
      elsif business_tax.percentage_with_tax_on_excess?
        tax_for_percentage_with_excess(gross_sale, business_tax)
      end
    end
    def set_tax(gross_sale)
    end

    private
    def tax_for_fixed_amount(gross_sale, tax)
      tax.tax_amount
    end

    def tax_for_percentage(gross_sale, tax)
      tax_amount = tax.tax_rate * gross_sale.amount
      if tax_amount > tax.minimum_tax_amount
        tax
      else
        tax.minimum_tax_amount
      end
    end

    def tax_for_percentage_with_excess(gross_sale, tax)
      tax_for_minimum_taxable(gross_sale, tax) +
      tax_for_excess(gross_sale, tax)
    end
    def tax_for_minimum_taxable(gross_sale, tax)
      tax.gross_limit * tax.tax_rate
    end

    def tax_for_excess(gross_sale, tax)
      tax_rate_for_excess * excess(gross_sale, tax)
    end

    def excess(gross_sale, tax)
      gross_sale.amount - tax.max_limit
    end
  end
end
