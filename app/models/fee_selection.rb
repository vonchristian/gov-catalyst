class FeeSelection < ApplicationRecord
  belongs_to :selector, polymorphic: true
  belongs_to :fee
end
