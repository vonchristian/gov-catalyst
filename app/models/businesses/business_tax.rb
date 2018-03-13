module Businesses
  class BusinessTax < ApplicationRecord
    belongs_to :tax
    belongs_to :business

    validates :tax_id, uniqueness: { scope: :business_id }

  end
end
