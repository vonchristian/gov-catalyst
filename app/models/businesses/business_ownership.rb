class BusinessOwnership < ApplicationRecord
  belongs_to :owner, polymorphic: true
  belongs_to :business
end
