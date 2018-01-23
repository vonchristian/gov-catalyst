class Amount < ApplicationRecord
  belongs_to :account
  belongs_to :entry
  belongs_to :commercial_document, polymorphic: true
end
