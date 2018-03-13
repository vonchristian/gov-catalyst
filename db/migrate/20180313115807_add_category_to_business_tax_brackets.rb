class AddCategoryToBusinessTaxBrackets < ActiveRecord::Migration[5.2]
  def change
    add_reference :business_tax_brackets, :category, foreign_key: true, type: :uuid
  end
end
