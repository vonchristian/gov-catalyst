class AddAmountToBusinessTaxes < ActiveRecord::Migration[5.2]
  def change
    add_column :business_taxes, :amount, :decimal
  end
end
