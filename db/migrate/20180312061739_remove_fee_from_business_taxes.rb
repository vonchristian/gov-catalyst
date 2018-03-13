class RemoveFeeFromBusinessTaxes < ActiveRecord::Migration[5.2]
  def change
    remove_reference :business_taxes, :fee, foreign_key: true, type: :uuid
  end
end
