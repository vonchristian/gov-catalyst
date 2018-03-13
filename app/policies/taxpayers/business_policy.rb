module Taxpayers
  class BusinessPolicy < ApplicationPolicy
    def index?
      business
    end
  end
end
