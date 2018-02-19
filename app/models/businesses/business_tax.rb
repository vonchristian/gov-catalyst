module Businesses
  class BusinessTax < ApplicationRecord
    belongs_to :fee
    belongs_to :business
  end
end
