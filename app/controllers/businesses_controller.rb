class BusinessesController < ApplicationController
    layout 'taxpayer'
  def index
    if params[:taxpayer_id].present?
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @businesses = @taxpayer.businesses
    else
      @businesses = Business.all
    end
  end
  def show
    @business = Business.find(params[:id])
  end
end
