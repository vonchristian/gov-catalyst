class CreateFees < ActiveRecord::Migration[5.2]
  def change
    create_table :fees, id: :uuid do |t|
      t.string :name
      t.decimal :amount, default: 0
      t.belongs_to :revenue_account, foreign_key: { to_table: :accounts }, type: :uuid

      t.timestamps
    end
    add_index :fees, :name, unique: true
  end
end
