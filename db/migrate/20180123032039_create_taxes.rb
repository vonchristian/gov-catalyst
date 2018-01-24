class CreateTaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :taxes, id: :uuid do |t|
      t.string :name
      t.decimal :amount
      t.belongs_to :revenue_account, foreign_key: { to_table: :accounts }, type: :uuid

      t.timestamps
    end
  end
end
