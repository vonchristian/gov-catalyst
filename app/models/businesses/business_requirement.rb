module Businesses
  class BusinessRequirement < ApplicationRecord
    belongs_to :business
    belongs_to :requirement
    has_many :verifications, class_name: "RequirementTransactions::Verification"
    has_many :applications,  class_name: "RequirementTransactions::Application"
    has_many :approvals,     class_name: "RequirementTransactions::Approval"
    has_many :revocations,   class_name: "RequirementTransactions::Verification"
    validates :requirement_id, uniqueness: { scope: :business_id }

    def self.approved?(options={})
      all.map{ |business_requirement| business_requirement.approved?(options) }
    end

    def applied?(options={})
      applications.on(options).present?
    end

    def approved?(options={})
      approvals.on(options).present?
    end

    def revoked?(options={})
      revocations.on(options).present?
    end

    def verified?(options={})
      verifications.on(options).present?
    end
  end
end
