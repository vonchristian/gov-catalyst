class SubsidiaryRequirement < ApplicationRecord
  belongs_to :main_requirement
  belongs_to :subsidiary_requirement
end
