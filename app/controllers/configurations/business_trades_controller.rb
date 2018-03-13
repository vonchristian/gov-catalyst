module Configurations
  class BusinessTradesController < ApplicationController
    def new
      @business_trade = Configurations::BusinessTrade.new
    end
    def create
      @business_trade = Configurations::BusinessTrade.create(trade_params)
      if @business_trade.valid?
        @business_trade.save
        redirect_to "/", notice: "Business trade saved successfully"
      else
        render :new
      end
    end

    private
    def trade_params
      params.require(:configurations_business_trade).
      permit(:name)
    end
  end
end
