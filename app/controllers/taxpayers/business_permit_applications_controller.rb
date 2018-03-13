module Taxpayers
  class BusinessPermitApplicationsController < ApplicationController
    def new
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @permit_application = Taxpayers::BusinessPermitApplication.new
    end
    def create
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @permit_application = Taxpayers::BusinessPermitApplication.new(permit_application_params)
      if @permit_application.valid?
        @permit_application.process!
        redirect_to "/", notice: "Application saved successfully"
      else
        render :new
      end
    end

    private
    def permit_application_params
      params.require(:taxpayers_business_permit_application).permit(:business_name, :taxpayer_id, :type_of_organization_id)
    end
  end
end
