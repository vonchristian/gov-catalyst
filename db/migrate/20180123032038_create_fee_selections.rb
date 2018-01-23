class CreateFeeSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :fee_selections, id: :uuid do |t|
      t.references :selector, polymorphic: true, type: :uuid
      t.belongs_to :fee, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
