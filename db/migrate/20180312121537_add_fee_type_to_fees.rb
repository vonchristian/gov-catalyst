class AddFeeTypeToFees < ActiveRecord::Migration[5.2]
  def change
    add_column :fees, :fee_type, :integer
    add_index :fees, :fee_type
  end
end
