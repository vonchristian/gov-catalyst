class CreateVouchers < ActiveRecord::Migration[5.2]
  def change
    create_table :vouchers, id: :uuid do |t|
      t.references :commercial_document, polymorphic: true, index: { name: 'index_commercial_document_on_vouchers' }
      t.datetime :date
      t.string :type

      t.timestamps
    end
    add_index :vouchers, :type
  end
end
