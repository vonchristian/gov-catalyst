class BusinessRegistrationsController < ApplicationController
  def new
    @registration = BusinessPermitApplication.new
  end
end
