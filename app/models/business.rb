class Business < ApplicationRecord
  belongs_to :type_of_organization
  has_many :business_ownerships
  has_many :taxpayer_owners, through: :business_ownerships, source: :owner, source_type: "Taxpayer"
  has_many :gross_sales
end
