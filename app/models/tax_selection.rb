class TaxSelection < ApplicationRecord
  belongs_to :tax
  belongs_to :selector, polymorphic: true
end
