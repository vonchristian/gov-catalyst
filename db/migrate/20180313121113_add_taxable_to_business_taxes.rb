class AddTaxableToBusinessTaxes < ActiveRecord::Migration[5.2]
  def change
    add_reference :business_taxes, :taxable, polymorphic: true, type: :uuid
  end
end
