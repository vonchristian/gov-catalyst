class Business < ApplicationRecord
  belongs_to :type_of_organization, class_name: "Configurations::TypeOfOrganization"
  has_many :business_ownerships,    class_name: "Businesses::BusinessOwnership"
  has_many :taxpayer_owners,        through: :business_ownerships,
                                    source: :owner,
                                    source_type: "Taxpayer"
  has_many :gross_sales,            class_name: "Businesses::GrossSale"
  has_many :business_activities,    class_name: "Businesses::BusinessActivity"
  has_many :business_trades,        class_name: "Configurations::BusinessTrade",
                                    through: :business_activities
  has_many :business_fees,          class_name: "Businesses::BusinessFee"
  has_many :fees,                   through: :business_fees
  has_many :business_taxes,         class_name: "Businesses::BusinessTax"
  has_many :taxes,                  through: :business_taxes
  has_many :business_requirements,  class_name: "Businesses::BusinessRequirement"
  has_many :requirements,           through: :business_requirements

  def business_owners
    taxpayer_owners
  end
end
