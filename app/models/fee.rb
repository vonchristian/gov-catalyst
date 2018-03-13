class Fee < ApplicationRecord
  enum payment_recurrence: [:anually, :one_time_payment]
  enum fee_type: [:fixed_amount, :percentage, :varies]
  belongs_to :revenue_account, class_name: "Account"
  belongs_to :feeable, polymorphic: true

  def self.total_amount
    sum(&:amount)
  end

  def paid(options={})
    revenue_account.balance(options)
  end

end
