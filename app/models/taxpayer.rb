class Taxpayer < ApplicationRecord
  has_many :business_ownerships, as: :owner
  has_many :businesses, through: :business_ownerships
end
