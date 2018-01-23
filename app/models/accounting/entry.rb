class Entry < ApplicationRecord
  belongs_to :commercial_document, polymorphic: true
  belongs_to :origin, polymorphic: true
  has_many :amounts
end
