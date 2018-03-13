module Businesses
  class BusinessTax < ApplicationRecord
    belongs_to :tax
    belongs_to :business
    belongs_to :taxable, polymorphic: true

    validates :tax_id, uniqueness: { scope: :taxable_id }

    delegate :name, to: :tax
  end
end
