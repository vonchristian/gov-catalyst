class Voucher < ApplicationRecord
  belongs_to :commercial_document, polymorphic: true
  has_many :voucher_amounts

end
