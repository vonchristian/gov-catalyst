class BusinessActivity < ApplicationRecord
  belongs_to :business
  belongs_to :business_trade
  delegate :fee_amount, to: :business_trade
end
