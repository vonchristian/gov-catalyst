class AddBusinessTaxAccountToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_reference :businesses, :business_tax_account, foreign_key: { to_table: :accounts }, type: :uuid
  end
end
