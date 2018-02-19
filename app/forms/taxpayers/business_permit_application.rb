module Taxpayers
  class BusinessPermitApplication
    include ActiveModel::Model
    attr_accessor :business_name, :taxpayer_id, :type_of_organization_id
    def process!
      ActiveRecord::Base.transaction do
        create_business
      end
    end

    private
    def create_business
      business = find_taxpayer.businesses.create!(
      name: business_name,
      type_of_organization_id: type_of_organization_id)
      verify_trade_name(business)
      find_applicable_requirements(business)
      assess_taxes(business)
      assess_fees(business)

    end
    def verify_trade_name(business)
      # TradeNameVerifier.verify(business)
    end

    def find_applicable_requirements(business)
    end

    def assess_taxes(business)
    end

    def assess_fees(business)
    end

    def find_taxpayer
      Taxpayer.find_by_id(taxpayer_id)
    end
  end
end
