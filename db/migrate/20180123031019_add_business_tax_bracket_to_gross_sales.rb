class AddBusinessTaxBracketToGrossSales < ActiveRecord::Migration[5.2]
  def change
    add_reference :gross_sales, :business_tax_bracket, foreign_key: true, type: :uuid
  end
end
