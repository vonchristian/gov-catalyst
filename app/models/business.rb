class Business < ApplicationRecord
  belongs_to :type_of_organization
  has_many :business_ownerships
  has_many :taxpayer_owners, through: :business_ownerships, source: :owner, source_type: "Taxpayer"
  has_many :gross_sales
  has_many :business_activities
  has_many :business_trades, through: :business_activities
  has_many :fee_selections, as: :selector
  has_many :fees, through: :fee_selections

  has_many :tax_selections, as: :selector
  has_many :taxes, through: :tax_selections
  has_many :requirement_applications, as: :applicants
end
