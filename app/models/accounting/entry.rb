class Entry < ApplicationRecord
  belongs_to :commercial_document, polymorphic: true
  belongs_to :origin, polymorphic: true
  has_one :official_receipt, as: :receiptable
  has_many :amounts

end
