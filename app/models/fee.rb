class Fee < ApplicationRecord
  enum payment_recurrence: [:anually, :one_time_payment]
  belongs_to :revenue_account, class_name: "Accounting::Account"
  belongs_to :accounts_receivable_account, class_name: "Accounting::Account"


  def self.total_amount
    sum(&:amount)
  end

  def paid(options={})
    revenue_account.balance(options)
  end

end
