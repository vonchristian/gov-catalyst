module Businesses
  class GrossSale < ApplicationRecord
    belongs_to :business

    delegate :category, to: :business
    delegate :tax_brackets, to: :category
    def total(options={})
      if options[:from_date] && options[:to_date]
        date_range = DateRange.new(from_date: options[:from_date], to_date: options[:to_date])
        where('calendar_year' => date_range).sum(:amount)
      else
        all.sum(:amount)
      end
    end
  end
end
