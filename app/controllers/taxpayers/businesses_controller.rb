module Taxpayers
  class BusinessesController < ApplicationController
    def index
      @taxpayer = current_taxpayer
      @businesses = @taxpayer.businesses
    end
  end
end
