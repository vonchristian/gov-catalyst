module Businesses
  class BusinessOwnership < ApplicationRecord
    belongs_to :owner, polymorphic: true
    belongs_to :business, class_name: "Business"
  end
end
