class TradeNameVerifier
  def verify(business)
    if business.sole_proprietorship?
      SoleProprietorshipTradeNameVerifier.verify(business)
    elsif business.cooperative?
      TradeNameVerifier.verify(business)
    elsif business.corporation? || business.partnership?
      TradeNameVerifier.verify(business)
    end
  end
end

class SoleProprietorshipTradeNameVerifier
  def verify(business)
    visit_search_page
    search_business_name
    create_verification
  end
end

