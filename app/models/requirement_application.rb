class RequirementApplication < ApplicationRecord
  belongs_to :requirement
  belongs_to :applicant, polymorphic: true
  has_one :approval
end
