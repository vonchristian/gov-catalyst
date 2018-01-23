class VoucherAmount < ApplicationRecord
  belongs_to :commercial_document, polymorphic: true
  belongs_to :account
end
