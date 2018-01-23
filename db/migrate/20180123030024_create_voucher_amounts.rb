class CreateVoucherAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :voucher_amounts, id: :uuid do |t|
      t.references :commercial_document, polymorphic: true, index: { name: 'index_commercial_document_on_voucher_amounts' }
      t.decimal :amount
      t.belongs_to :account, foreign_key: true, type: :uuid
      t.belongs_to :voucher, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
