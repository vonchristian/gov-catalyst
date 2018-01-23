class AddFeeableToFees < ActiveRecord::Migration[5.2]
  def change
    add_reference :fees, :feeable, polymorphic: true, type: :uuid
  end
end
