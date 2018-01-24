class Tax < ApplicationRecord
  belongs_to :revenue_account, class_name: "Accounting::Account"
end
