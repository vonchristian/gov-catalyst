class Requirement < ApplicationRecord
  has_many :subsidiary_requirements
  has_many :applicale_fees
  has_one :tax_calculator
  def find_applicable_fee(fee_finder: name.constantize+ "Finder")

end
