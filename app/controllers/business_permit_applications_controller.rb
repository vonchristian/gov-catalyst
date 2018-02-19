class BusinessPermitApplicationsController < ApplicationController
  def new
    @registration = BusinessPermitApplication.new
  end
end
