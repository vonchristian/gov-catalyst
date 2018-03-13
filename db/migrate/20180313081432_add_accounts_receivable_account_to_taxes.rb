class AddAccountsReceivableAccountToTaxes < ActiveRecord::Migration[5.2]
  def change
    add_reference :taxes, :accounts_receivable_account, foreign_key: { to_table: :accounts }, type: :uuid
  end
end
