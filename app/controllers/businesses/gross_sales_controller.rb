module Businesses
  class GrossSalesController < ApplicationController
    def new
      @business = Business.find(params[:business_id])
      @gross_sale = Businesses::GrossSalesEntry.new
    end
    def create
       @business = Business.find(params[:business_id])
      @gross_sale = Businesses::GrossSalesEntry.new(gross_sale_params)
      if @gross_sale.valid?
        @gross_sale.save
        redirect_to business_url(@business), notice: "Gross sale saved successfully"
      else
        render :new
      end
    end

    private
    def gross_sale_params
      params.require(:businesses_gross_sales_entry).
      permit(:amount, :calendar_year, :employee_id, :business_id)
    end
  end
end
