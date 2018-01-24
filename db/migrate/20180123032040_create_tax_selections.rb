class CreateTaxSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :tax_selections, id: :uuid do |t|
      t.belongs_to :tax, foreign_key: true, type: :uuid
      t.references :selector, polymorphic: true, type: :uuid

      t.timestamps
    end
  end
end
