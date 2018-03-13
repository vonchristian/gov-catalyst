class RequirementTransaction < ApplicationRecord
  belongs_to :client, polymorphic: true
  belongs_to :business_requirement, class_name: "Businesses::BusinessRequirement"
  def self.on(options={})
    if options[:from_date] && options[:to_date]
    end
  end
end
