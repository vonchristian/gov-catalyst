module Businesses
  class BusinessTax < ApplicationRecord
    belongs_to :tax
    belongs_to :business
  end
end
