class CreateBusinessTaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :business_taxes, id: :uuid do |t|
      t.belongs_to :fee, foreign_key: true, type: :uuid
      t.belongs_to :business, foreign_key: true, type: :uuid
      t.datetime :date
      t.decimal :cost, default: 0

      t.timestamps
    end
  end
end
