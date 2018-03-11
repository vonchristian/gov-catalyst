class Amount < ApplicationRecord
  belongs_to :account, touch: true
  belongs_to :entry
  belongs_to :commercial_document, polymorphic: true, touch: true

end
