module Accounting
  class Account < ApplicationRecord
    has_many :amounts
    has_many :entries, through: :amounts
  end
end
