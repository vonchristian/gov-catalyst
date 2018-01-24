module FeeCalculators
  class MayorsPermitFeeAmountCalculator
    def calculate(business)
      business.business_activities.collect{|activity| activity.fee_amount }.sum
    end
    def calculate(tricycle)
      231
    end
  end
end
