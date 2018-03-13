module Fees
  module MayorsPermitFees
    class ForBusinessComputation
      def compute(business)
        business.line_of_businesses.sum(&:mayors_permit_fee_amount)
      end
    end
  end
end
