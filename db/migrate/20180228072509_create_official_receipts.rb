class CreateOfficialReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :official_receipts, id: :uuid do |t|
      t.integer :number
      t.datetime :date
      t.references :receiptable, polymorphic: true, type: :uuid

      t.timestamps
    end
  end
end
