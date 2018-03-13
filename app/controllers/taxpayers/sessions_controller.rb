module Taxpayers
  class SessionsController < Devise::SessionsController
    private
    def after_sign_in_path_for(resource)
      taxpayer_path(resource)
    end
  end
end
