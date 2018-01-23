class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries, id: :uuid do |t|
      t.string :reference_number
      t.datetime :entry_date
      t.references :commercial_document, polymorphic: true, type: :uuid, index: { name: "index_commercial_document_on_entries" }
      t.references :origin, polymorphic: true, type: :uuid

      t.timestamps
    end
  end
end
