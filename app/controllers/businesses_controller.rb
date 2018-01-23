class BusinessesController < ApplicationController
  def index
    @business = Business.all
  end
end
