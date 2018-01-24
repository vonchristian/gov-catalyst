class AddPaymentRecurrenceToFees < ActiveRecord::Migration[5.2]
  def change
    add_column :fees, :payment_recurrence, :integer, default: 0
    add_index :fees, :payment_recurrence
  end
end
