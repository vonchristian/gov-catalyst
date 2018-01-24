class RequirementApproval < ApplicationRecord
  belongs_to :approver, polymorphic: true
  belongs_to :approved_document, polymorphic: true
end
