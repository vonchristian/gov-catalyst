class Tax < ApplicationRecord
  belongs_to :revenue_account, class_name: "Accounting::Account"

  def paid_amount(options={})
    revenue_account.balance(options)
  end
end
