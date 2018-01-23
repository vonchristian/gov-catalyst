class Fee < ApplicationRecord
  belongs_to :revenue_account, class_name: "Account"
  def self.total_amount
    sum(&:amount)
  end
end
