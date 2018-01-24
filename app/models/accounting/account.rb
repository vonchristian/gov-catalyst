module Accounting
  class Account < ApplicationRecord
    has_many :entries
    has_many :amounts, through: :entries
  end
end
