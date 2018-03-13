class Requirement < ApplicationRecord
  belongs_to :main_requirement, class_name: "Requirement", foreign_key: 'main_requirement_id'
  has_many :subsidiary_requirements, class_name: "Requirement", foreign_key: 'main_requirement_id'

end


#add subsidiary_requirements to business requirements
#requirement.fees.each do |fee|
#business.business_fees.find_or_create_by(fee: fee)
