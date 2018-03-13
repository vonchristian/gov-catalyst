module Businesses
  class BusinessFee < ApplicationRecord
    belongs_to :fee
    belongs_to :business


    validates :fee_id, uniqueness: { scope: :business_id }
  end
end
