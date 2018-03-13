module Businesses
  class GrossSalesEntry
    include ActiveModel::Model
    attr_accessor :business_id,
                  :employee_id,
                  :calendar_year,
                  :amount
    validates :calendar_year, :amount, presence: true
    validates :amount, numericality: true
    def save
      ActiveRecord::Base.transaction do
        save_gross_sale
      end
    end

    private
    def find_business
      Business.find_by_id(business_id)
    end
    def save_gross_sale
      gross_sale = find_business.gross_sales.create(
        amount: amount,
        date: calendar_year)
      create_tax(gross_sale)
    end
    def create_tax(gross_sale)
      Businesses::BusinessTax.create!(
      business: find_business,
      tax: Tax.find_by(name: "Business Tax"),
      amount: Taxes::BusinessTaxes::Computation.new(gross_sale).compute,
      taxable: gross_sale)
    end
  end
end
