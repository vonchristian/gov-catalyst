class AddTaxToBusinessTaxes < ActiveRecord::Migration[5.2]
  def change
    add_reference :business_taxes, :tax, foreign_key: true, type: :uuid
  end
end
