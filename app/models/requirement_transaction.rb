class RequirementTransaction < ApplicationRecord
  belongs_to :client, polymorphic: true
  belongs_to :business_requirement, class_name: "Businesses::BusinessRequirement"
end
