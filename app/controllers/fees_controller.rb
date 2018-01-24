class FeesController < ApplicationController
  def new
    @business = Business.find(params[:business_id])
    @fee = Fee.new
  end
end
