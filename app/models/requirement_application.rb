class RequirementApplication < ApplicationRecord
  belongs_to :requirement
  belongs_to :applicant, polymorphic: true
  has_one :approval
  has_many :fees
  has_many :taxes
end
