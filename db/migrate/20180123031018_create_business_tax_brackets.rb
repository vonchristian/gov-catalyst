class CreateBusinessTaxBrackets < ActiveRecord::Migration[5.2]
  def change
    create_table :business_tax_brackets, id: :uuid do |t|
      t.decimal :minimum_gross_sale
      t.decimal :maximum_gross_sale
      t.decimal :tax_amount
      t.integer :tax_rate
      t.integer :tax_type
      t.decimal :tax_rate_for_excess
      t.decimal :gross_limit

      t.timestamps
    end
    add_index :business_tax_brackets, :tax_type
  end
end
