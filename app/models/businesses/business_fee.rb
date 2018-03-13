module Businesses
  class BusinessFee < ApplicationRecord
    enum fee_type: [:fixed_amount, :percentage, :varies]
    belongs_to :fee
    belongs_to :business


    validates :fee_id, uniqueness: { scope: :business_id }
  end
end
