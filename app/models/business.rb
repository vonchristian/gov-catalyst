class Business < ApplicationRecord
  belongs_to :type_of_organization, class_name: "Configurations::TypeOfOrganization"
  has_many :business_ownerships, class_name: "Businesses::BusinessOwnership"
  has_many :taxpayer_owners, through: :business_ownerships, source: :owner, source_type: "Taxpayer"
  has_many :gross_sales
  has_many :business_activities
  has_many :business_trades, through: :business_activities

  def owners
    taxpayer_owners
  end
end
