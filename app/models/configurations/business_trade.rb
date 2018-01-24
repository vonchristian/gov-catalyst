class BusinessTrade < ApplicationRecord
  belongs_to :sub_category
  has_one :fee, as: :feeable
  delegate :amount, to: :fee, prefix: true
  accepts_nested_attributes_for :fee
end
