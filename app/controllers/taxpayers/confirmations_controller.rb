module Taxpayers
  class ConfirmationsController < Devise::ConfirmationsController

    private

    def after_confirmation_path_for(resource_name, resource)
      taxpayer_path(resource)
    end

  end
end
