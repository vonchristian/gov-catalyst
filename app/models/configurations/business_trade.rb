class BusinessTrade < ApplicationRecord
  belongs_to :sub_category
  has_many :mayors_permit_fees, as: :feeable
end
