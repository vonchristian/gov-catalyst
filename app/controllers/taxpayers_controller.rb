class TaxpayersController < ApplicationController
  layout 'taxpayer'
  def show
    @taxpayer = Taxpayer.find(params[:id])
  end
end
