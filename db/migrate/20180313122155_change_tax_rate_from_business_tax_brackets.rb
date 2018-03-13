class ChangeTaxRateFromBusinessTaxBrackets < ActiveRecord::Migration[5.2]
  def change
    change_column :business_tax_brackets, :tax_rate, :decimal
  end
end
