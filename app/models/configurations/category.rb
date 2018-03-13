module Configurations
  class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :tax_brackets, class_name: "Configurations::BusinessTaxBracket"
  end
end
