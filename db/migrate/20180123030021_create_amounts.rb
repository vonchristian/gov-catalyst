class CreateAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :amounts, id: :uuid do |t|
      t.belongs_to :account, foreign_key: true, type: :uuid
      t.belongs_to :entry, foreign_key: true, type: :uuid
      t.string :type
      t.references :commercial_document, polymorphic: true, type: :uuid, index: { name: "index_commercial_document_on_amounts" }
      t.decimal :amount, default: 0
      t.timestamps
    end
    add_index :amounts, :type
  end
end
