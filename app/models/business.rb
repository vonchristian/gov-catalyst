class Business < ApplicationRecord
  belongs_to :type_of_organization
  has_many :business_ownerships
  has_many :taxpayer_owners, through: :business_ownerships, source: :owner, source_type: "Taxpayer"
  has_many :gross_sales
  has_many :business_activities
  has_many :business_trades, through: :business_activities

  has_many :requirement_applications, as: :applicant
end
