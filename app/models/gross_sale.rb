class GrossSale < ApplicationRecord
  belongs_to :business
  after_save :set_tax_amount
  private
  def set_tax_amount
    GrossSaleTaxBracket.set_tax(self)
  end
end
