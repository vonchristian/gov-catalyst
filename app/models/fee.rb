class Fee < ApplicationRecord
  enum payment_recurrence: [:anually, :one_time_payment]
  belongs_to :revenue_account, class_name: "Account"
  belongs_to :feeable, polymorphic: true
  def self.total_amount
    sum(&:amount)
  end
end
