class CreateRequirementTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :requirement_transactions, id: :uuid do |t|
      t.string :type
      t.datetime :date
      t.references :client, polymorphic: true, type: :uuid
      t.belongs_to :business_requirement, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :requirement_transactions, :type
  end
end
