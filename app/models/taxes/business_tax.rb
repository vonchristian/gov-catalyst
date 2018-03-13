module Taxes
  class BusinessTax < Tax

    def paid_business_taxes(options={})
      revenue_account.credits_balance(commercial_document_id: self.id, from_date: options[:from_date], to_date: options[:to_date])
    end

    def unpaid_business_taxes(options={})
      revenue_account.debits_balance(commercial_document_id: self.id, from_date: options[:from_date], to_date: options[:to_date])
    end
    def balance(options)
      revenue_account.debits_balance(commercial_document_id: self.id, from_date: options[:from_date], to_date: options[:to_date])
    end
  end
end
