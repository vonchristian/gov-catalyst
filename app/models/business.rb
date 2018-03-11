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
  def paid_business_taxes(options={})
    business_tax_account.credits_balance(commercial_document_id: self.id, from_date: options[:from_date], to_date: options[:to_date])
  end

  def unpaid_business_taxes(options={})
    business_tax_account.balance(commercial_document_id: self.id, from_date: options[:from_date], to_date: options[:to_date])
  end
end
