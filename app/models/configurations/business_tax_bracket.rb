class BusinessTaxBracket < ApplicationRecord
  enum tax_type: [:fixed_amount, :percentage, :percentage_with_tax_on_excess]
  def self.set_tax(gross_sale)
        tax = gross_sale.gross_sales_tax_business_category.gross_sales_taxes.select{|a| a.amount_range.include?(gross_sale.amount)}.first
        return gross_sale.tax_amount = gross_sales_tax.tax_amount if gross_sales_tax.tax_type_fixed_amount?
        return gross_sale.tax_amount = gross_sale.amount * gross_sales_tax.tax_rate if gross_sales_tax.tax_type_percentage?
        return gross_sale.tax_amount = gross_sales_tax.gross_limit * gross_sales_tax.tax_rate + ((gross_sale.amount - gross_sales_tax.gross_limit) * (gross_sales_tax.tax_rate_for_excess)) if gross_sales_tax.tax_type_percentage_with_tax_on_excess?
        gross_sale.save
      end
end
