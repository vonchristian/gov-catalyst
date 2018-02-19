module Businesses
  class BusinessRequirement < ApplicationRecord
    belongs_to :business
    belongs_to :requirement
    has_many :verifications,    class_name: "RequirementTransactions::Verification"

    def applied?
      applications.current.present?
    end

    def approved?
      approvals.current.present?
    end

    def revoked?
      revocation.present?
    end

    def verified?
      verifications.current.present?
    end
  end
end
