module Configurations
  class BusinessTrade < ApplicationRecord
    belongs_to :sub_category, optional: true
  end
end
